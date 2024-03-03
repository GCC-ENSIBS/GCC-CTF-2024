# MLWeb

## Description

Exploit a few vulnerabilities in a web application to get the flag.

Do not hesitate to look at the source code of the `load` model function.

Author: [xanhacks](https://twitter.com/xanhacks)

## Solve

Register a user with the following username: `../model/load/1#`. When the bot will visit the user profile, a request to `/model/load/1` will be sent as an administrator user thanks to this vulnerable code:

```js
document.addEventListener("DOMContentLoaded", function () {
    const statusLabel = document.getElementById("statusLabel");
    
    fetch('/profile/{{ user.username }}/is_logged')
        .then(response => response.json())
        .then(data => {
            if (data.is_logged) {
                statusLabel.innerHTML = "Status: <strong class='text-success'>Active</strong>";
            } else {
                statusLabel.innerHTML = "Status: <strong class='text-danger'>Inactive</strong>";
            }
        }
    );
});
```

Upload a malicious model with the same as the model of the administrator to overwrite it (name: `example_model.zip`). Now you control the content of the model which will be loaded by the administrator.

```python
filename = secure_filename(file.filename)
file_path = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
file.save(file_path)
```

To create a malicious model, exploit a 0day inside `hummingbird-ml` to obtain RCE when a model is loaded. More details [here](https://huntr.com/bounties/9423d282-d26c-4fe9-b71b-3bbe7319a29d/).

See [solve.py](./solve/solve.py) & [gen_malicious_model.py](./solve/gen_malicious_model.py) for more details.