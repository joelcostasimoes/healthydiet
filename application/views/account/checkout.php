<div class="single-product-area" ng-controller="checkout">
    <div class="container">
        <form action="<?=base_url()?>createOrder" method="post" accept-charset="utf-8" ng-init="productsInCard=<?php echo $data_card; ?>;total=<?php echo $data_total_card; ?>; result=total>=30 ? total : total+5; transport=<?php echo $data_transport; ?>">
            <div class="row checkout">
                <div class="col-md-6 col-sm-12 col-xs-12 with-line">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <label>
                                Nome:
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <?php echo ucfirst($data_user['user']->fname); ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <label>
                                Apelido:
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <?php echo ucfirst($data_user['user']->lname); ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <label>
                                Email
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <?php echo $data_user['user']->email; ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <label>
                                Telefone:
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <?php  if($data_user['user']->phone > 0) echo $data_user['user']->phone; ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <label>
                                NIF <small> (Número de Identificação Fiscal)</small>:
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <?php echo $data_user['user']->nif; ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <h4>Morada de Facturação: </h4>
                        </div>
                    </div>
                    <div class="address">
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Morada
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                               <?php if(!is_null($data_user['faddress']->address)) echo ucfirst($data_user['faddress']->address); ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Código Postal
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12 postal-cod">
                                <?php 
                                    if(!is_null($data_user['faddress']->zipNumber)) echo $data_user['faddress']->zipNumber; 
                                    if(!is_null($data_user['faddress']->zipName)) echo " ".ucfirst($data_user['faddress']->zipName); 
                                ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Localidade
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <?php if(!is_null($data_user['faddress']->city)) echo ucfirst($data_user['faddress']->city); ?>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <h4>Morada de Entrega: </h4>
                        </div>
                    </div>
                    <div class="address">
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Morada
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <?php 
                                    if(!is_null($data_user['eaddress'])) 
                                        echo ucfirst($data_user['eaddress']->address);
                                    else
                                        echo ucfirst($data_user['faddress']->address); 
                                 ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Código Postal
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12 postal-cod">
                                <?php 
                                    if(!is_null($data_user['eaddress'])) 
                                        echo $data_user['eaddress']->zipNumber; 
                                    else
                                        echo $data_user['faddress']->zipNumber; 
                                    if(!is_null($data_user['eaddress'])) 
                                        echo " ".ucfirst($data_user['eaddress']->zipName); 
                                    else
                                        echo " ".ucfirst($data_user['faddress']->zipName); 
                                ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    Localidade
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <?php 
                                    if(!is_null($data_user['eaddress'])) 
                                        echo ucfirst($data_user['eaddress']->city); 
                                    else
                                        echo ucfirst($data_user['faddress']->city); 
                                ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <label>
                                    País
                                </label>
                            </div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <?php 
                                    if(!is_null($data_user['eaddress'])) 
                                        echo ucfirst($data_user['eaddress']->country); 
                                    else
                                        echo ucfirst($data_user['faddress']->country); 
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="col-md-12 col-sm-12">
                        <h4>Métodos de pagamento: </h4>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12 type-payment">
                            <label for="rm" class="col-xs-12">
                                <input type="radio" name="type_payment" ng-model="typePayment.value" ng-value="'1'" id="rm"> 
                                Referência Multibanco
                            </label>
                            <label for="tb" class="col-xs-12">
                                <input type="radio" name="type_payment" ng-model="typePayment.value" ng-value="'2'" id="tb"> 
                                Transferência Bancária
                            </label>
                            <label for="pc" class="col-xs-12">
                                <input type="radio" name="type_payment" ng-model="typePayment.value" ng-value="'3'" id="pc"> 
                                Pagamento à cobrança
                            </label>
                        </div>
<!--
                        <div class="col-md-12 col-sm-12 col-xs-12 tabpanel type_payment" role="tabpanel" ng-show="typePayment.value==1">
                            <div class="row">
                                <hr class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <img src="https://www.lusopay.com/wp-content/uploads/2015/05/Logo-LUSOPAY-quadrado-60x60px.png" alt=""/>
                                    <img src="https://www.lusopay.com/wp-content/uploads/2015/04/multibanco-2.png" alt=""/>
                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    Entidade: 20343
                                    <input type="hidden" name="entity" value="0">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    Referência: 138 445 742
                                    <input type="hidden" name="reference"  value="0">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    Montante: 100€
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 tabpanel" role="tabpanel" ng-show="typePayment.value==2">
                            <div class="row">
                                <hr class="col-md-12 col-sm-12 col-xs-12">
                                <div>
                                <img src="<?=base_url()?>public/img/bank-transfer.png" alt=""/> NIB: 0010 0000 5361 5170 0010 4
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 tabpanel" role="tabpanel" ng-show="typePayment.value==3">
                            <div class="row">
                                <hr class="col-md-12 col-sm-12 col-xs-12">
                                <div>
                                    <img src="<?=base_url()?>public/img/payment-method.png" alt=""/> O pagamento no acto da entrega tem custos adicionais para o cliente.
                                </div>
                            </div>
                        </div>-->
                    </div>
                    <div class="summary">
                        <div class="row header-summary">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    Artigo
                                </div>
                                
                                <div class="col-md-1 col-sm-1 col-xs-1">
                                    Qtd
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1 hidden-xxs">
                                    Iva   
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1 hidden-xxs">
                                    Desc   
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    Pr. Unit
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    Preço
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12" ng-repeat="product in productsInCard">
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    {{product.name}}
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1 qt-price">
                                    {{product.quantity}}
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1 hidden-xxs">
                                    {{product.iva}}% 
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1 hidden-xxs">
                                    {{product.discount}}% 
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 qt-price">
                                    {{product.price}}€
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 qt-price">
                                    {{product.price * product.quantity}}€
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="row" ng-hide="total>=50">
                            <div class="col-md-12 col-sm-12 col-xs-12 value-summary">
                                <hr>
                                <div class="col-md-10 col-sm-10 col-xs-10">
                                    Portes:
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                
                                    {{transport}}€
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 value-summary">
                                <hr>
                                <div class="col-md-10 col-sm-10 col-xs-10">
                                    Sub-Total:
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    {{total.total * 1 + transport * 1}}€
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 value-summary">
                                <hr>
                                <div class="col-md-10 col-sm-10 col-xs-10">
                                    Descontos:
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    {{total.totalDiscount}}€
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div>
                                    <hr>
                                    <div class="col-md-10 col-sm-10 col-xs-10">
                                        Total:
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">
                                        {{(total.total * 1 + transport * 1) | number:2}}€ 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row more">
                        <div class="col-md-12 col-sm-12">
                                Mais Informações:
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <textarea rows="5" class="col-md-12 col-sm-12  col-xs-12" placeholder="Introduza informação relevante para que a entrega seja efectuda correctamente." name="more_info"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12 btn-checkout" >
                            <button class="add_to_cart_button button-checkout floatright" type="submit">Concluir Encomenda</button>
                            <a class="add_to_cart_button button-checkout floatright" href="<?php echo base_url().$historic; ?>">Voltar</a>
                        </div>
                    </div>                    
                </div>
            </div>
        </form>
    </div>
</div>
