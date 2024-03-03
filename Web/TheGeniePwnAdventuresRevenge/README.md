# The Genie pwn's adventures

A markdown write-up for the challenge.

## Description

Genie asked you to exploit the new ransomware's chat platform BockLit that is being used to steal compromised company's money.

Author: [Synacktiv](https://www.synacktiv.com/)
Author: [xThaz](https://twitter.com/0xThaz)

## Introduction

The challenge involves exploiting a web application's session fixation vulnerability to perform a Cross-Site Scripting (XSS) attack. The target application is vulnerable to an overflow in the cookie jar, which allows an attacker to inject malicious JavaScript code into the application's cookies. By exploiting this vulnerability, the attacker can gain unauthorized access to sensitive data, such as session cookies, and perform actions on behalf of the victim.

## Vulnerability Overview

The main vulnerability lies in the session fixation mechanism implemented by the web application. When a user logs in, the application sets an authentication cookie, but it fails to properly sanitize the cookie values. This allows an attacker to manipulate the cookie data, leading to a potential overflow in the cookie jar. Additionally, the application does not adequately protect against XSS attacks, allowing an attacker to inject arbitrary JavaScript code into the application's cookies.

## Exploit Description

### Step 1: Registration

The attacker initiates the attack by registering a new user account on the target web application. This account will be used to trigger the session fixation vulnerability.

### Step 2: Login

After registering the user account, the attacker logs in to the application using the credentials generated during registration. This step establishes a valid session with the application.

### Step 3: Sending Malicious Messages

The attacker sends a series of malicious messages to the application, each containing JavaScript code embedded within the message content. This JavaScript code will be executed by the victim's browser when they view the message.

### Step 4: Triggering the XSS Payload

The attacker includes an XSS payload within one of the malicious messages. This payload exploits the session fixation vulnerability by overflowing the cookie jar with a large number of cookies. Additionally, the payload sets the attacker's authorization cookie, allowing them to gain unauthorized access to sensitive resources.

### Step 5: Retrieving the Flag

Finally, the attacker retrieves the flag by accessing a protected resource on the target web application using the compromised session cookies. The XSS payload ensures that the attacker's authorization cookie is recognized by the application, granting them access to the flag.
Exploit Code Analysis

The provided exploit script performs the following actions:

    1. Registers a new user account on the target web application.
    2. Logs in to the application using the generated credentials.
    3. Sends a series of malicious messages containing JavaScript code.
    4. Triggers the XSS payload by overflowing the cookie jar and setting the attacker's authorization cookie.
    5. Retrieves the flag by accessing a protected resource on the application.

## Conclusion

The challenge demonstrates the importance of proper session management and input validation in web applications. By exploiting the session fixation vulnerability and the lack of input sanitization, an attacker can execute arbitrary JavaScript code within the context of the application, leading to unauthorized access and potential data breaches. To mitigate such attacks, developers should implement secure session handling practices, validate user input, and sanitize data before processing it. Additionally, regular security assessments and code reviews can help identify and remediate vulnerabilities before they are exploited by malicious actors.