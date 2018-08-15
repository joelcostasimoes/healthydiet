    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2 class="footer-wid-title">HEALTHY Diet</h2>
                        <p>
                            A Healthy Diet é uma marca nacional que possui produtos próprios, com um espaço onde encontra uma selecção dos melhores produtos aos melhores preços e com grande diversidade de marcas.</p>
                        <div class="footer-social">
                            <a href="https://www.facebook.com/nutritionandwellnessHD" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-google"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Links Uteis</h2>
                        <ul>
                            <li><a href="#">Política de privacidade</a></li>
                            <li><a href="#">Termos e condições de uso</a></li>
                            <li><a href="#">Centro de apoio de consumo ao consumidor</a></li>
                            <?php if($user_logged!=TRUE){ ?>
                            <li><a href="<?=base_url()?>register">Registar</a></li>
                            <?php } ?>
                            <li><a href="<?=base_url()?>contacts">Contacte-nos</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categorias</h2>
                        <ul>
                            <li><a href="<?=base_url()?>products/categories/1">Emagrecimento</a></li>
                            <li><a href="<?=base_url()?>products/categories/2">Anti-Celulite</a></li>
                            <li><a href="<?=base_url()?>products/categories/3">Controlo de Apetite</a></li>
                            <li><a href="<?=base_url()?>products/categories/4">Circulação</a></li>
                            <li><a href="<?=base_url()?>products/categories/5">Fígado e Vesícula</a></li>
                            <li><a href="<?=base_url()?>products/categories/6">Trânsito Intestinal</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6" ng-controller="subscriveNewsletter" >
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Subscreva a nossa newsletter e receba todas as nossas novidades.</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Introduza o seu email" ng-model="email">
                            <label for="terms" class="terms-conditions">
                                <input type="checkbox" name="terms" id="terms" required value="1" ng-model="terms">
                                <small> <a href="<?=base_url()?>termsOfUse" target="_blank">*Li e aceito os Termos e Condições da HEALTHY Diet e todos os outros Termos e Políticas que possam ser aplicáveis.</a></small> 
                            </label>
                            <button ng-click="subscrive()" class="add_to_cart_button">Subscrever</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>&copy; 2016 HealthyDiet. All Rights Reserved. Developed by JCS </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
 