from pwn import remote
import json
from Crypto.Util.number import long_to_bytes, bytes_to_long
from math import ceil
from math import log2
from math import sqrt

def hilbert_class_polynomial_roots(D, gf):
    """
    Computes the roots of H_D(X) mod q given D and GF(q).
    TODO: implement "Accelerating the CM method" by Sutherland.
    :param D: the CM discriminant (negative)
    :param gf: the finite field GF(q)
    :return: a generator generating the roots (values j)
    """
    assert D < 0 and (D % 4 == 0 or D % 4 == 1), "D must be negative and a discriminant"
    H = hilbert_class_polynomial(D)
    pr = gf["x"]
    for j in pr(H).roots(multiplicities=False):
        yield j


def generate_curve(gf, k, c=None):
    """
    Generates an Elliptic Curve given GF(q), k, and parameter c
    :param gf: the finite field GF(q)
    :param k: j / (j - 1728)
    :param c: an optional parameter c which is used to generate random a and b values (default: random element in Zmod(q))
    :return:
    """
    c_ = c if c is not None else 0
    while c_ == 0:
        c_ = gf.random_element()

    a = 3 * k * c_ ** 2
    b = 2 * k * c_ ** 3
    return EllipticCurve(gf, [a, b])


def solve_cm(D, q, c=None):
    """
    Solves a Complex Multiplication equation for a given discriminant D, prime q, and parameter c.
    :param D: the CM discriminant (negative)
    :param q: the prime q
    :param c: an optional parameter c which is used to generate random a and b values (default: random element in Zmod(q))
    :return: a generator generating elliptic curves in Zmod(q) with random a and b values
    """
    assert is_prime_power(q)

    gf = GF(q)
    if gf.characteristic() == 2 or gf.characteristic() == 3:
        return

    ks = []
    for j in hilbert_class_polynomial_roots(D, gf):
        if j != 0 and j != gf(1728):
            k = j / (1728 - j)
            yield generate_curve(gf, k, c)
            ks.append(k)

    while len(ks) > 0:
        for k in ks:
            yield generate_curve(gf, k, c)

def generate_anomalous_q(q, D=None, c=None):
    """
    Generates random anomalous elliptic curves for a specific modulus.
    More information: Leprevost F. et al., "Generating Anomalous Elliptic Curves"
    :param q: the prime finite field modulus
    :param D: the (negative) CM discriminant to use (default: randomly chosen from [-11, -19, -43, -67, -163])
    :param c: the parameter c to use in the CM method (default: random value)
    :return: a generator generating random anomalous elliptic curves
    """
    # Idea:
    # 4q = t^2 - Dv^2
    # Dv^2 = t^2 - 4q
    # -> if D divides 1 - 4q and the result is square, it is a good D value
    Ds = [-11, -19, -43, -67, -163] if D is None else [D]
    Ds = [D for D in Ds if (1 - 4 * q) % D == 0 and is_square((1 - 4 * q) // D)]
    assert len(Ds) > 0, "Invalid value for q and default values of D."
    D = choice(Ds)
    for E in solve_cm(D, q, c):
        if E.trace_of_frobenius() == 1:
            yield E
        else:
            E = E.quadratic_twist()
            yield E


def generate_anomalous(q_bit_length, D=None, c=None):
    """
    Generates random anomalous elliptic curves for a specific modulus bit length.
    More information: Leprevost F. et al., "Generating Anomalous Elliptic Curves"
    :param q_bit_length: the bit length of the modulus, used to generate a random q
    :param D: the (negative) CM discriminant to use (default: randomly chosen from [-11, -19, -43, -67, -163])
    :param c: the parameter c to use in the CM method (default: random value)
    :return: a generator generating random anomalous elliptic curves
    """
    Ds = [-11, -19, -43, -67, -163] if D is None else [D]
    while True:
        # Idea:
        # 4q = t^2 - Dv^2
        # 4q = 1 - D(2m + 1)^2
        # 4q = 1 - D(4m^2 + 4m + 1)
        # q = -Dm^2 - Dm - (D + 1) / 4
        D = choice(Ds)
        m_bit_length = (q_bit_length - int(D).bit_length()) // 2 + 1
        m = randrange(2 ** (m_bit_length - 1), 2 ** m_bit_length)
        q = -D * m * (m + 1) + (-D + 1) // 4
        if int(q).bit_length() == q_bit_length and is_prime(q):
            yield from generate_anomalous_q(q, D, c)

def a0(P, Q): 
    if P[2] == 0 or Q[2] == 0 or P == -Q: 
        return 0 
    if P == Q: 
        a = P.curve().a4() 
        return (3*P[0]^2+a)/(2*P[1]) 
    return (P[1]-Q[1])/(P[0]-Q[0]) 

def add_augmented(PP, QQ):
    (P, u), (Q, v) = PP, QQ
    return [P+Q, u + v + a0(P,Q)]

def scalar_mult(n, PP):
    t = n.nbits()
    TT = PP.copy()
    for i in range(1,t):
        bit = (n >> (t-i-1)) & 1
        TT = add_augmented(TT, TT)
        if bit == 1:
            TT = add_augmented(TT, PP)
    return TT

def solve_ecdlp(P,Q,p):
    R1, alpha = scalar_mult(p, [P,0])
    R2, beta  = scalar_mult(p, [Q,0])
    return ZZ(beta*alpha^(-1))

def shortest_vectors(B):
    """
    Computes the shortest non-zero vectors in a lattice.
    :param B: the basis of the lattice
    :return: a generator generating the shortest non-zero vectors
    """
    B = B.LLL()

    for row in B.rows():
        if not row.is_zero():
            yield row

def attack_knapsack(a, s):
    """
    Tries to find e_i values such that sum(e_i * a_i) = s.
    This attack only works if the density of the a_i values is < 0.9048.
    More information: Coster M. J. et al., "Improved low-density subset sum algorithms"
    :param a: the a_i values
    :param s: the s value
    :return: the e_i values, or None if the e_i values were not found
    """
    n = len(a)
    d = n / log2(max(a))
    #N = ceil(1 / 2 * sqrt(n))
    N = 2**2000
    print(f"{d = }")
    assert d < 0.9408, f"Density should be less than 0.9408 but was {d}."

    L = matrix(QQ, n + 1, n + 1)
    for i in range(n):
        L[i, i] = 1
        L[i, n] = N * a[i]

    L[n] = [1 / 2] * n + [N * s]

    for v in shortest_vectors(L):
        s_ = 0
        e = []
        for i in range(n):
            ei = 1 - (v[i] + 1 / 2)
            if ei != 0 and ei != 1:
                break

            ei = int(ei)
            s_ += ei * a[i]
            e.append(ei)

        if s_ == s:
            return e

E = next(generate_anomalous(768))

p = E.cardinality()

print(E)

r = remote("0.0.0.0",int(31337))

print(r.recvuntil(b"= "))
r.sendline(str(int(p)).encode())

print(r.recvuntil(b"= "))
r.sendline(str(int(E.a4())).encode())

print(r.recvuntil(b"= "))
r.sendline(str(int(E.a6())).encode())

points = json.loads(r.recvline().decode())

points = [E(int(point[0]),int(point[1])) for point in points["values"]]

s = eval("E"+r.recvline().decode())

n = len(points)
N = ceil(sqrt(n) / 2)

values = [solve_ecdlp(E.gens()[0],point,p) for point in points]
print("len(values)", len(values))

s_new = solve_ecdlp(E.gens()[0],s,p)

for k in range(30,40):
    res = attack_knapsack(values,k*p+s_new)
    if res is not None:
        print(b"GCC{"+long_to_bytes(int("".join(str(a) for a in res),2))+b"}")