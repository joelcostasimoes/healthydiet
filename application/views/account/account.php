<div class="single-product-area">
    <div class="container">
        <div role="tabpanel">
            <ul class="product-tab" role="tablist">
                <li role="presentation" ng-class="{'active': page == NULL}"><a href="#my-account" aria-controls="my-account" role="tab" data-toggle="tab">Os meus dados</a></li>
                <li role="presentation" ng-class="{'active': page == 'orders'}"><a href="#orders" aria-controls="orders" role="tab" data-toggle="tab">As minha encomendas</a></li>
                <li role="presentation" ng-class="{'active': page == 'cart'}"><a href="#cart" aria-controls="cart" role="tab" data-toggle="tab">Carrinho de compras</a></li>
            </ul>

            <div class="tab-content"  ng-init="orders=<?php echo $data_orders; ?>; pending_orders=<?php echo $data_pending_orders; ?>; card=<?php echo $data_card; ?>;
             itemLength=<?php echo $data_itemLength; ?>; subTotal=<?php echo $sub_total; ?>; page=<?php echo $page; ?>;">
                <div role="tabpanel" class="tab-pane fade" id="my-account" ng-controller="my-account" ng-class="{'in active': page == NULL}">
                    <form action="<?=base_url()?>updateAccount" method="post" accept-charset="utf-8" id="formUpdateAccount">
                        <?php echo validation_errors('<span class="error">', '</span>');?>
                        <div class="row create-account">
                            <div class="col-md-6 col-sm-12 with-line">
                                <div class="row">
                                    <div class="col-md-4 col-sm-12 required-fields">
                                        <small>* Campos obrigatórios</small>
                                    </div>
                                </div>
                                <?php if($data_user['user']->type==2){ ?>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12">
                                        <label>
                                            *Nome da Empresa
                                        </label>
                                        </div>
                                        <div class="col-md-8 col-sm-12">
                                            <input type="text" name="nameCompany" value="<?php echo ucfirst($data_user['user']->nameCompany); ?>" placeholder="" required>
                                        </div>
                                    </div>
                                    <hr>
                                <?php } ?>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        *Nome
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="fname" value="<?php echo ucfirst($data_user['user']->fname); ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        *Apelido
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="lname" value="<?php echo ucfirst($data_user['user']->lname); ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        *Email
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="email" id="email" value="<?php echo $data_user['user']->email; ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            Telefone
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="number" name="phone" id="phone" value="<?php if(strlen($data_user['user']->phone)>=9) echo $data_user['user']->phone; ?>" placeholder="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            Telemóvel
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="number" name="mobile" id="mobile" value="<?php if(strlen($data_user['user']->mobile)>=9) echo $data_user['user']->mobile; ?>" placeholder="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        *NIF <small> (Número de Identificação Fiscal)</small>
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="nif" id="nif" value="<?php echo $data_user['user']->nif; ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            *Password
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="Password" name="password" id="password" value="" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">                        
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            *Confirmar Password
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="Password" name="cpassword" id="cpassword" value="" placeholder="" >
                                    </div>
                                </div>
                                
                                
                                
                            </div>
                            <div class="col-md-6 col-sm-12">
                            <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <h4>Morada de Facturação: </h4>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            *Morada
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="faddress" id="faddress" value="<?php if(!is_null($data_user['faddress']->address)) echo $data_user['faddress']->address; ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        *Código Postal
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12 postal-cod">
                                        <input type="text" name="fzipNumber" id="fzipNumber" value="<?php if(!is_null($data_user['faddress']->zipNumber)) echo $data_user['faddress']->zipNumber; ?>" placeholder="" > 
                                        <input type="text" name="fzipName" id="fzipName" value="<?php if(!is_null($data_user['faddress']->zipName)) echo $data_user['faddress']->zipName; ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            *Localidade
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="fcity" id="fcity" value="<?php if(!is_null($data_user['faddress']->city)) echo $data_user['faddress']->city; ?>" placeholder="" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            *País
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <select name="fcountry" id="fcountry">
                                              <option <?php  echo ((!is_null($data_user['faddress']) and $data_user['faddress']->country == '') ? 'selected' : '')?> value="">-</option>
                                              
                                            <?php 
                                                foreach ($data_countries as $value) {
                                                    echo '<option ' . ((!is_null($data_user['faddress']) and $data_user['faddress']->country == $value) ? 'selected' : ''). ' value="' . $value . '">' . $value . '</option>';
                                                }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <h4>Morada de Entrega: </h4>
                                    </div>
                                    <div class="col-md-12 col-sm-12 check-receiver-address">
                                        <label for="typeAddress">
                                            <input type="checkbox" name="typeAddress" id="typeAddress" value="<?php if(!is_null($data_user['typeAddress'])) echo $data_user['typeAddress']; ?>" <?php if($data_user['typeAddress']==1) echo "checked"; ?>>
                                            <small> A minha morada de facturação é a mesma que a morada de entrega.</small> 
                                        </label>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            Morada
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="eaddress" id="eaddress" value="<?php if(!is_null($data_user['eaddress'])) echo $data_user['eaddress']->address; ?>" placeholder="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                    <label>
                                        Código Postal
                                    </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12 postal-cod">
                                        <input type="text" name="ezipNumber" id="ezipNumber" value="<?php if(!is_null($data_user['eaddress'])) echo $data_user['eaddress']->zipNumber; ?>" placeholder=""> 
                                        <input type="text" name="ezipName" id="ezipName"  value="<?php if(!is_null($data_user['eaddress'])) echo $data_user['eaddress']->zipName; ?>" placeholder="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            Localidade
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <input type="text" name="ecity" id="ecity" value="<?php if(!is_null($data_user['eaddress'])) echo $data_user['eaddress']->city; ?>" placeholder="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <label>
                                            País
                                        </label>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <select name="ecountry" id="ecountry">
                                          <option <?php  echo ((!is_null($data_user['eaddress']) and $data_user['eaddress']->country == '') ? 'selected' : '')?> value="">-</option>
                                          
                                          <?php 
                                                foreach ($data_countries as $value) {
                                                    echo '<option ' . ((!is_null($data_user['eaddress']) and $data_user['eaddress']->country == $value) ? 'selected' : '') . ' value="' . $value . '">' . $value . '</option>';
                                                }
                                           ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <!--<p class="notice">
                                        ATENÇÃO:
                                        O fornecimento de uma morada de entrega incorreta ou incompleta pode originar o retorno da encomenda à HEALTHYDiet, originando custos adicionais para o cliente. Por este motivo, recomendamos que se certifique sempre de que a morada de entrega indicada aquando do registo da encomenda está efetivamente correta e completa. Uma morada correta e completa deve incluir elementos como o tipo de via (rua, largo, avenida, edifício, bairro, praça, etc) e o respetivo nome, número da porta ou lote e o andar (se aplicável).
                                    </p>-->
                                    <div class="col-md-12 col-sm-12 terms-conditions">
                                        <label for="newsletter">
                                            <input type="checkbox" name="newsletter" id="newsletter"  value="1" <?php echo ($newsletter!=null && $newsletter->isActive==1  ? 'checked' : '');?>>
                                            <small> Pretendo subscrever a newsletter da HEALTHY Diet.</small> 
                                        </label>
                                    </div>
                                </div>
                            <?php echo validation_errors('<span class="error">', '</span>');?>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 btn-register">
                                        <button class="add_to_cart_button floatright" id="sbtSave">Guardar</button>
                                    </div>
                                </div>                    
                            </div>
                        </div>
                    </form>
        
                </div>
                <div role="tabpanel" class="tab-pane fade" id="orders" ng-class="{'in active': page == 'orders'}">
                    <h2 class="product-wid-title">Encomendas pendentes</h2>
                    <div>
                        <div class="row head">
                            <div class="col-md-4 col-sm-5 col-xs-5 hidden-xxs">
                                Nº de Encomenda    
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4 hidden-xxs">
                                Data  
                            </div>
                            <div class="col-md-4 col-sm-3 col-xs-3">
                                Fatura
                            </div>
                        </div>
                        <hr>
                        <div ng-repeat="order in orders" ng-hide="orders==null">
                            <div class="row">
                                <div class="col-md-4 col-sm-5 col-xs-5 hidden-xxs">
                                    {{order.id}}     
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4 hidden-xxs">
                                    {{order.date}}     
                                </div>
                                <div class="col-md-4 col-sm-3 col-xs-3">
                                    <a href="<?=base_url()?>receipt/{{order.id}}" target="_blank">Recibo nº {{order.id}}</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="content_list_empty" ng-show="orders==null">
                                Não possui encomendas efectuadas!!
                        </div>
                    </div>

                    <h2 class="product-wid-title">Encomendas efectuadas</h2>
                    <div>
                        <div class="row head">
                            <div class="col-md-4 col-sm-5 col-xs-5 hidden-xxs">
                                Nº de Encomenda    
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4 hidden-xxs">
                                Data  
                            </div>
                            <div class="col-md-4 col-sm-3 col-xs-3">
                                Fatura
                            </div>
                        </div>
                        <hr>
                        <div ng-repeat="order in pending_orders" ng-hide="pending_orders==null">
                            <div class="row">
                                <div class="col-md-4 col-sm-5 col-xs-5 hidden-xxs">
                                    {{order.cod_order}}     
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4 hidden-xxs">
                                    {{order.date}}     
                                </div>
                                <div class="col-md-4 col-sm-3 col-xs-3">
                                    <a href="<?=base_url()?>invoice/{{order.id}}" target="_blank">Factura nº {{order.id}}</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="content_list_empty" ng-show="pending_orders==null">
                                Não possui encomendas efectuadas!!
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade list-card" id="cart" ng-controller="cart" ng-class="{'in active': page == 'cart'}">
                    <form action="<?=base_url()?>updateCard" method="post" accept-charset="utf-8">
                        <div>
                            <div ng-repeat="item in card track by $index" ng-hide="card.length==0 || card==null" class="col-md-6 col-sm-6 col-xs-12 list-cart">
                                <div id="div_{{$index}}" class="block">
                                    <i class="remove-item fa fa-times" ng-click="removeItem($index);"></i>
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <a href="<?=base_url()?>product/{{item.idProduct}}">
                                            <div class="product-upper">
                                                <div>
                                                    <img ng-src="<?=base_url()?>public/img/products/{{item.idProduct}}.png" alt="" fallback-src="<?=base_url()?>public/img/products/default.png">
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-8">
                                        <div class="row">
                                            <p>{{item.name}}</p>
                                        </div>
                                        <div class="row">
                                            <p>Preço Unitário: {{item.price}}€</p>
                                        </div>
                                        <div class="row">
                                            Quantidade: <input type="number" size="4" ng-model="quantity" ng-init="quantity=item.quantity*1" class="input-text qty text" title="Qty" value="{{item.quantity*1}}" name="quantity<?php echo $user_logged['id'];?>_{{item.idProduct}}" min="1" step="1" ng-click="update_total($index,quantity)">
                                        </div>
                                        <div class="row">
                                            <p>Sub Total: {{item.price*quantity}}€</p>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="row table-row list" id="div_{{$index}}">
                                    <div class="col-md-2 hidden-s hidden-sm"><p>{{item.idProduct}}</p></div>
                                    <div class="col-md-12 col-sm-4 col-xs-4"><p>{{item.name}}</p></div>
                                    <div class="col-md-2 col-sm-3 col-xs-3"><p>{{item.price}}€</p></div>
                                    <div class="col-md-2 col-sm-3 col-xs-3 quantity"></div>
                                    <div class="col-md-2 col-sm-3 col-xs-3"><p>{{item.price*quantity}}€</p></div>
                                    <div class="col-md-1 col-sm-1 col-xs-1"><i class="remove-item fa fa-trash-o" ng-click="removeItem($index);"></i></div>
                                </div>-->
                            </div>
                            <div class="content_list_empty" ng-show="itemLength==0 || card==null">
                                Não existe produtos no carrinho de compras!!
                            </div>
                        </div>
                        <div class="row col-md-12 col-sm-12 col-xs-12 total" ng-hide="itemLength==0 || card==null">
                        Total: {{subTotal}}€
                        </div>
                        <div class="row col-md-12 col-sm-12 col-xs-12" ng-hide="itemLength==0 && card==null">
                                <a href="<?=base_url()?>checkout" class="add_to_cart_button floatright btn-register" ng-hide="itemLength==0 || card==null">Continuar</a>
                                <button class="add_to_cart_button floatright btn-register" ng-hide="card==null">Guardar</button>
                                <button class="add_to_cart_button floatright btn-register" type='button' ng-hide="card==null" ng-click="cancel();">Cancelar</button>
                        </div> 
                    </form>
                </div> 
            </div>
        </div>
    </div>
</div>