# Name of the challenge

A markdown write-up for the challenge.

## Attacker

### Get /login

autorisation = 111111
authentication = random

### POST /login

autorisation = 111111
authentication = user

### POST /xss

cookie_jar{
    autorisation = 222222
}

## Admin

### GET /login

autorisation = 222222 // A cause du cookie jar overflow, sinon ça aurait été 333333
authentication = random

### POST /login

autorisation = 222222
authentication = admin

## Attacker

### GET /flag

autorisation = 222222
authentication = user