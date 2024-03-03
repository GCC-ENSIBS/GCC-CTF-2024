const loginForm = document.getElementById('login-form');
loginForm.addEventListener("submit", loginFormSubmit);

function showError(message){
    document.getElementById('responseToCall').innerHTML = `
        <div class="uk-alert-danger" uk-alert>
            <a href class="uk-alert-close" uk-close></a>
            <p class="uk-text-center uk-margin-right uk-margin-left">${message}</p>
        </div>`;
}

function loginFormSubmit(e) {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
        credentials: 'include'
    }).then(response => {
        if(response.status === 200){
            document.getElementById('responseToCall').innerHTML = `
            <div class="uk-alert-success" uk-alert>
                <a href class="uk-alert-close" uk-close></a>
                <p class="uk-text-center uk-margin-right uk-margin-left">Login successful, redirecting </p>
            </div>`;
            setTimeout(() => {
                location=`/panel`;
            }, 1500);   
        }else if(response.status === 400){
            showError('Invalid request');
        }else if(response.status === 401){
            showError('Invalid credentials');
        }else if(response.status === 404){
            showError('User not found');
        }else{
            showError('Something went wrong');
        }
    }).catch(error => {
        showError('Something went wrong (details in console)');
        console.log(error);
    });
}