        <div class="container single-product-area" ng-controller="contact">
        <div class="row">
            <div class="col-md-5 col-sm-12 col-xs-12">
                <h2 class="sidebar-title col-md-12">
                    Contactos
                </h2>
                <div class="col-md-12">
                    <p>
                        Healthy diet
                    </p>
                    <p>
                        Telefone: 249328322
                    </p>
                    <p>
                        Telemóvel: 912828281
                    </p>
                    <p>
                        Email: geral@healthydiet.pt
                    </p>
                    <small>*(Encomendas Online) Atendimento de 2ª a Sábadoª, das 10h às 20h, excepto feriados.</small>
                </div>
            </div>
            <div class="col-md-7 col-sm-12 col-xs-12">
                <h2 class="sidebar-title col-md-12 col-sm-12 col-xs-12">
                    formulário
                </h2>

                <form action="#" method="post" accept-charset="utf-8" id="formContact">
                    <div class="submit-review">
                        <div class="col-md-12 col-sm-12 required-fields">
                                <small>* Campos obrigatórios</small>
                        </div>
                        <p class="col-md-6 col-sm-12 col-xs-12"><label for="name">*Nome</label> <input name="name" ng-model="name" type="text"></p>
                        <p class="col-md-6 col-sm-12 col-xs-12"><label for="email">*Email</label> <input name="email" ng-model="email" type="email"></p>
                        <p class="col-md-6 col-sm-12 col-xs-12"><label for="email">*Assunto</label> <input name="subject" ng-model="subject" type="text"></p>
                        <p class="col-md-12 col-sm-12 col-xs-12"><label for="review">*Mensagem</label> <textarea name="message" ng-model="message" id="" cols="30" rows="10"></textarea></p>
                        <div class="col-md-12 col-sm-12 col-xs-12 show-errors">
                            <div class="waiting"></div>
                            <div class="error"></div> 
                            <div class="success"></div> 
                        </div>
                        <p class="col-md-12 col-sm-12 col-xs-12"><input class="add_to_cart_button" type="submit" value="Enviar"></p>
                    </div>
                </form>
            </div>
        </div>
