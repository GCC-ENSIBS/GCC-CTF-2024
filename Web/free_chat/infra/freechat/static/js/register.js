const registerForm = document.getElementById('register-form');
registerForm.addEventListener("submit", registerFormSubmit);

function showError(message){
    document.getElementById('responseToCall').innerHTML = `
        <div class="uk-alert-danger" uk-alert>
            <a href class="uk-alert-close" uk-close></a>
            <p class="uk-text-center uk-margin-right uk-margin-left">${message}</p>
        </div>`;
}

function registerFormSubmit(e) {
    e.preventDefault();
    const username = document.getElementById('register-username').value;
    const password = document.getElementById('register-password').value;
    const repeatPassword = document.getElementById('register-repeatPassword').value;

    fetch('/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password , repeatPassword}),
        credentials: 'include'
    }).then(response => {
        if(response.status === 200){
            document.getElementById('responseToCall').innerHTML = `
            <div class="uk-alert-success" uk-alert>
                <a href class="uk-alert-close" uk-close></a>
                <p class="uk-text-center uk-margin-right uk-margin-left">Registering successful, you can now login. Redirecting </p>
            </div>`;
            setTimeout(() => {
                location=`/`;
            }, 1500);   
        }else if(response.status === 400){
            showError('Invalid request');
        }else if(response.status === 401){
            showError('Passwords do not match');
        }else if(response.status === 404){
            showError('Username already exists');
        }else{
            showError('Something went wrong');
        }
    }).catch(error => {
        showError('Something went wrong (details in console)');
        console.log(error);
    });
}