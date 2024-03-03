You need to access the news page with a "True" subcription.

The website checks this subscription using a signature mechanism.

A RSA signature is forged based on the message: {username : [subscribe]} with the username and a boolean for the subscription.

The RSA private key is generated using random.getrandbits() with a fixed seed based on the username.
Then, the factors are predictable, and the private key can be retrieve.

Forge a new signature with the subscribe argument at True, and you can access the news !!
