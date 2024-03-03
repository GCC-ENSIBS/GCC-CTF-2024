const reminderForm = document.getElementById('reminder-form');
reminderForm.addEventListener("submit", reminderFormSubmit);

function showError(message){
    document.getElementById('responseToCall').innerHTML = `
        <div class="uk-alert-danger" uk-alert>
            <a href class="uk-alert-close" uk-close></a>
            <p class="uk-text-center uk-margin-right uk-margin-left">${message}</p>
        </div>`;
}

function reminderFormSubmit(e) {
    e.preventDefault();
    const reminder_content = document.getElementById('reminder_content').value;

    fetch('/reminder', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ reminder_content }),
        credentials: 'include'
    }).then(response => {
        if(response.status === 200){
            document.getElementById('responseToCall').innerHTML = `
            <div class="uk-alert-success" uk-alert>
                <a href class="uk-alert-close" uk-close></a>
                <p class="uk-text-center uk-margin-right uk-margin-left">Reminder added;</p>
            </div>`;
            setTimeout(() => {
                location=`/panel`;
            }, 500);   
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