<script language=javascript type="text/javascript">
    var now = new Date();
    var monthName = new Array ("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro");
    document.getElementById("curr-date").innerHTML = now.getDate() + " de " + monthName[now.getMonth()]   +  " de "  + now.getFullYear();
</script>
<!-- Latest jQuery form server -->
<!--<script src="https://code.jquery.com/jquery.min.js"></script>-->

<script src="<?=base_url()?>/public/script/jQuery-2.1.4.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
<script src="<?=base_url()?>/public/script/angular.dcb-img-fallback.min.js"></script>

<!-- jQuery sticky menu -->
<script src="<?=base_url()?>/public/script/owl.carousel.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

      $("#owl-demo").owlCarousel({
        loop:true,
        autoPlay : 3000,
        stopOnHover : true,
        navigation:false,
        paginationSpeed : 1000,
        goToFirstSpeed : 2000,
        singleItem : true,
        autoHeight : true,
        transitionStyle:"fade"
    });


  });
</script>
<script src="<?=base_url()?>/public/script/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="<?=base_url()?>/public/script/jquery.easing.1.3.min.js"></script>
<script src="<?=base_url()?>/public/script/jquery.validate.min.js"></script>

<!-- Main Script -->
<script src="<?=base_url()?>/public/script/main.js"></script>

<script src="<?=base_url()?>/public/script/controller.js"></script>
<script src="<?=base_url()?>/public/script/paging.js"></script>
