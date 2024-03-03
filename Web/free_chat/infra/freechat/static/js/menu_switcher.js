document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const switchRegister = document.getElementById('switchRegister');
    const switchLogin = document.getElementById('switchLogin');

    switchLogin.addEventListener('click', function (e) {
        e.preventDefault();
        loginForm.hidden = false;
        registerForm.hidden = true;
    });

    switchRegister.addEventListener('click', function (e){
        e.preventDefault();
        loginForm.hidden = true;
        registerForm.hidden = false;
    })
});