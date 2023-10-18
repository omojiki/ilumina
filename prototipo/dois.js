var ul = document.querySelector('nav ul');
var menuBtn = document.querySelector('.menu-btn i');

function menuShow() {
    if (ul.classList.contains('open')) {
        ul.classList.remove('open');
    } else {
        ul.classList.add('open');
    }
}

// Recupere os parâmetros da URL
var urlParams = new URLSearchParams(window.location.search);
var rua = urlParams.get('rua');
var cep = urlParams.get('cep');
var latitude = urlParams.get('latitude');
var longitude = urlParams.get('longitude');

// Preencha os campos de texto com os valores recuperados
document.getElementById('localizacao').value = rua + ' - CEP: ' + cep + ', Lat: ' + latitude + ', Long: ' + longitude;