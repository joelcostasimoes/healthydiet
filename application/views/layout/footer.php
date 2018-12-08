    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Nutribem</h2>
                        <ul>
                            <li><a href="">Quem Somos</a></li>
                            <li><a href="<?=base_url()?>whereWeAre">Onde estamos</a></li>
                            <li><a href="<?=base_url()?>contacts">Contactos</a></li>
                        </ul>
                        <div class="footer-social">
                            <a href="https://www.facebook.com/nutritionandwellnessHD" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-google"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Encomendas</h2>
                        <ul>
                            <li><a href="#">Portes/Entrega</a></li>
                            <li><a href="#">Devoluções e trocas</a></li>
                            <li><a href="#">Método de pagamento</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Siga-nos</h2>
                        <div class="footer-social">
                            <ul>
                                <li><a href="https://www.facebook.com/nutritionandwellnessHD" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fa fa-google"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fa fa-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Reclamações</h2>
                        <ul>
                            <li><a href="#">Sugestões e reclamações</a></li>
                            <li><a href="#">Livro de reclamações electrónico</a></li>
                            <li><a href="#">Método de pagamento</a></li>
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
                                <small> <a href="<?=base_url()?>termsOfUse" target="_blank">*Li e aceito os termos e condições da Nutribem Unip Lda e todos os outros termos e políticas aplicáveis.</a></small>
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
                        <p>&copy; 2018 Nutribem Unipessoal Lda. All Rights Reserved. Developed by JCS </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


