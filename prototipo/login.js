var ul = document.querySelector('nav ul');
var menuBtn = document.querySelector('.menu-btn i');

function menuShow() {
    if (ul.classList.contains('open')) {
        ul.classList.remove('open');
    }else{
        ul.classList.add('open');
    }
}


<?php if (isset($_SESSION['erro'])) { ?>
    // Exiba um popup (modal) com a mensagem de erro
    alert('<?php echo $_SESSION['erro']; ?>');
    // Limpe a variável de sessão
    <?php unset($_SESSION['erro']); ?>
<?php } ?>