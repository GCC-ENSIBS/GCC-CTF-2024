const resetForm = document.getElementById('reset-form');
resetForm.addEventListener("submit", resetFormSubmit);

function error(message){
    document.getElementById('responseToCall').innerHTML = `
        <div class="uk-alert-danger" uk-alert>
            <a href class="uk-alert-close" uk-close></a>
            <p class="uk-text-center uk-margin-right uk-margin-left">${message}</p>
        </div>`;
}

function resetFormSubmit(e) {
    e.preventDefault();
    const username = document.getElementById('username-pw-reset').value;

    fetch('/api/v1/reset-password', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username }),
        credentials: 'include'
    }).then(response => {
        if(response.status === 200){
            response.json().then(data => {
                document.getElementById('responseToCall').innerHTML = `
                <div class="uk-alert-success" uk-alert>
                    <a href class="uk-alert-close" uk-close></a>
                    <p class="uk-text-center uk-margin-right uk-margin-left">${data['message']}</p>
                </div>`; 
            });
        }else if(response.status === 400){
            error('Invalid request');
        }else if(response.status === 404){
            error('User not found');
        }else{
            error('Something went wrong');
        }
    }).catch(error => {
        error('Something went wrong (details in console)');
        console.log(error);
    });
}