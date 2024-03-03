document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('login-form');
    const resetForm = document.getElementById('reset-form');
    const switchReset = document.getElementById('switchReset');
    const switchLogin = document.getElementById('switchLogin');

    switchLogin.addEventListener('click', function (e) {
        e.preventDefault();
        loginForm.hidden = false;
        resetForm.hidden = true;
    });

    switchReset.addEventListener('click', function (e){
        e.preventDefault();
        loginForm.hidden = true;
        resetForm.hidden = false;
    })
});