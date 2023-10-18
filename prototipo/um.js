window.addEventListener('scroll', function() {
    var navbar = document.querySelector('.navbar');
    var scrollY = window.scrollY || window.pageYOffset;

    if (scrollY > 100) { // Mude 100 para o ponto de rolagem desejado
        navbar.classList.add('fixed');
    } else {
        navbar.classList.remove('fixed');
    }
});
var ul = document.querySelector('nav ul');
var menuBtn = document.querySelector('.menu-btn i');

function menuShow() {
if (ul.classList.contains('open')) {
ul.classList.remove('open');
}else{
ul.classList.add('open');
}
}
var map = L.map('map', {
    zoomControl: false // Remover os botões de zoom "+" e "-"
}).setView([-29.7581, -57.0856], 13); // Latitude e Longitude iniciais de Uruguaiana, RS

var uruguaianaBounds = L.latLngBounds([-30.0, -58.0], [-29.5, -56.5]); // Limites geográficos de Uruguaiana

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

var marker;
var locationInfoDiv = document.getElementById('location-info');
var latitudeSpan = document.getElementById('latitude');
var longitudeSpan = document.getElementById('longitude');
var streetSpan = document.getElementById('street');
var postalCodeSpan = document.getElementById('postalCode');

// Função para atualizar as informações de localização na página
function updateLocationInfo(latitude, longitude, street, postalCode) {
    latitudeSpan.textContent = latitude.toFixed(6);
    longitudeSpan.textContent = longitude.toFixed(6);
    streetSpan.textContent = street || 'N/A';
    postalCodeSpan.textContent = postalCode || 'N/A';
}

// Evento de clique no mapa
map.on('click', function(e) {
    var latlng = e.latlng;
    
    if (uruguaianaBounds.contains(latlng)) {
        // O clique está dentro dos limites de Uruguaiana, então pode adicionar o marcador
        if (marker) {
            map.removeLayer(marker);
        }
        marker = L.marker(latlng).addTo(map);

        // Obtenha e exiba as informações de geolocalização reversa
        reverseGeocode(latlng.lat, latlng.lng);
    } else {
        // O clique está fora dos limites de Uruguaiana, não faça nada
        alert("Por favor, escolha um local dentro de Uruguaiana, RS.");
    }
});

// Função para obter informações de geolocalização reversa
function reverseGeocode(latitude, longitude) {
    fetch('https://nominatim.openstreetmap.org/reverse?format=json&lat=' + latitude + '&lon=' + longitude)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            var address = data.address;
            var street = address.road || address.street;
            var postalCode = address.postcode;

            // Atualize as informações de localização na página
            updateLocationInfo(latitude, longitude, street, postalCode);
        })
        .catch(function(error) {
            console.error(error);
        });
}

var avancarButton = document.getElementById('avancar-button');
avancarButton.addEventListener('click', function() {
// Coloque aqui a ação que você deseja realizar quando o botão for clicado
});



function redirectToDenuncia() {
    // Obtenha os valores do endereço, latitude e longitude
    var rua = document.getElementById('street').textContent;
    var cep = document.getElementById('postalCode').textContent;
    var latitude = document.getElementById('latitude').textContent;
    var longitude = document.getElementById('longitude').textContent;

    // Codifique os valores para que possam ser passados via URL
    var ruaCodificada = encodeURIComponent(rua);
    var cepCodificado = encodeURIComponent(cep);
    var latitudeCodificada = encodeURIComponent(latitude);
    var longitudeCodificada = encodeURIComponent(longitude);

    // Redirecione para a página de denúncia1.html com os parâmetros na URL
    window.location.href = 'dois.html?rua=' + ruaCodificada + '&cep=' + cepCodificado + '&latitude=' + latitudeCodificada + '&longitude=' + longitudeCodificada;
}