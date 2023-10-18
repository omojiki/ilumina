var ul = document.querySelector('nav ul');
var menuBtn = document.querySelector('.menu-btn i');

function menuShow() {
    if (ul.classList.contains('open')) {
        ul.classList.remove('open');
    }else{
        ul.classList.add('open');
    }
}

document.getElementById("togglePassword").addEventListener("click", function () {
    const passwordInput = document.getElementById("password");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
});


document.addEventListener("DOMContentLoaded", function () {
    const registrationForm = document.querySelector("form");
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm-password");

    registrationForm.addEventListener("submit", function (e) {
        if (passwordInput.value !== confirmPasswordInput.value) {
            alert("As senhas não coincidem. Tente novamente.");
            e.preventDefault(); // Impede o envio do formulário se as senhas não coincidirem.
        }
    });
});