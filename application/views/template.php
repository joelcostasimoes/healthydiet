
<!DOCTYPE html>
<?php header('Access-Control-Allow-Origin: *'); ?>
<html lang="pt" ng-app="healthyDiet">
<?php $this->load->view('layout/head'); ?>
<body>
    <?php $this->load->view('layout/header'); ?>
    <section id="main">
        <section id="content">
            <?php echo $content; ?>
        </section>
    </section>
    <?php $this->load->view('layout/footer'); ?>
    <?php $this->load->view('layout/script'); ?>
</body>
</html>
