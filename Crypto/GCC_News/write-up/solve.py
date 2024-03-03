from Crypto.Util.number import bytes_to_long, isPrime
import random
import hashlib
import math
import base64

def generate_key(username):
    
	length = lambda x : len(bin(x)[2:])

	s = bytes_to_long(username.encode())

	random.seed(s)

	e = 0x1001
	phi = 0
    
	while math.gcd(phi,e) != 1:
		n = 1
		factors = []

		while length(n) < 2048:
			temp_n = random.getrandbits(48)
			if isPrime(temp_n):
				n *= temp_n
				factors.append(temp_n)
		phi = 1
		for f in factors:
			phi *= (f - 1)

	d = pow(e, -1, phi)

	return (n,e), (n,d)

def hash_string_sha256(message):
    message_bytes = message.encode('utf-8')
    sha256_hash = hashlib.sha256()
    sha256_hash.update(message_bytes)
    hashed_message = sha256_hash.digest()

    return int.from_bytes(hashed_message, byteorder='big')

def generate_signature(message, private_key):
    n, d = private_key
    hashed_message = hash_string_sha256(message)
    signature = pow(hashed_message, d, n)
    
    return signature

## On the web page, create a user "theo"

pub, priv = generate_key("theo")

signature = generate_signature(str({"theo": [True]}), priv)

print(f"Forged signature : {signature}")

message = base64.b64encode(str({"theo": [True]}).encode()).decode()

url = "http://localhost:5000:/news?token=" + str(signature) + "&message=" + message

print(f"URL : {url}")
## Request to this URL, and you will have access to the news !!
