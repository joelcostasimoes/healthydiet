<div class="single-product-area" ng-controller="register">
    <div class="container">
        <form action="<?=base_url()?>createAccount" method="post" accept-charset="utf-8" id="formRegister">
            <div class="row create-account col-sm-12">
                <h2>Criar Conta</h2>
                <hr>
                <div class="col-md-6 col-sm-12 with-line">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 required-fields">
                            <small>* Campos obrigatórios</small>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <label>
                                <input type="checkbox" name="type" id="type" ng-model="type" value="2"> Sou uma empresa?
                            
                            </label>
                        </div>
                    </div>
                    <div class="row" ng-show="type">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *Nome da Empresa
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="nameCompany" value="" placeholder="" required>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *Nome
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="fname" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *Apelido
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="lname" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *Email
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="email" id="email" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label>
                                Telefone
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="number" name="phone" id="phone" value="" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label>
                                Telemóvel
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="number" name="mobile" id="mobile" value="" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *NIF <small> (Número de Identificação Fiscal)</small>
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="nif" id="nif" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label>
                                *Password
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="Password" name="password" id="password" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">                        
                        <div class="col-md-4 col-sm-12">
                            <label>
                                *Confirmar Password
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="Password" name="cpassword" id="cpassword" value="" placeholder="" required>
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
                            <input type="text" name="faddress" id="faddress" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            *Código Postal
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12 postal-cod">
                            <input type="text" name="fzipNumber" id="fzipNumber" value="" placeholder="" required> 
                            <input type="text" name="fzipName" id="fzipName" value="" placeholder="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label>
                                *Localidade
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="fcity" id="fcity" value="" placeholder="" required>
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
                                <option selected value="">-</option>
                                <?php 
                                    foreach ($data_countries as $value) {
                                        echo '<option value="' . $value . '">' . $value . '</option>';
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
                                <input type="checkbox" name="typeAddress" id="typeAddress" value="1">
                                <small> A minha morada de facturação é a mesma que a morada de entrega.</small> 
                            </label>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <label>
                                Morada
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="eaddress" id="eaddress" value="" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                        <label>
                            Código Postal
                        </label>
                        </div>
                        <div class="col-md-8 col-sm-12 postal-cod">
                            <input type="text" name="ezipNumber" id="ezipNumber" value="" placeholder=""> 
                            <input type="text" name="ezipName" id="ezipName"  value="" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label>
                                Localidade
                            </label>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <input type="text" name="ecity" id="ecity" value="" placeholder="">
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
                                <option selected value="">-</option>
                                <?php 
                                    foreach ($data_countries as $value) {
                                        echo '<option value="' . $value . '">' . $value . '</option>';
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
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 ">
                            <label for="terms" class="terms-conditions">
                                <input type="checkbox" name="terms" id="terms" required value="1">
                                <small> <a href="<?=base_url()?>termsOfUse" target="_blank">*Li e aceito os Termos e Condições da HEALTHY Diet e todos os outros Termos e Políticas que possam ser aplicáveis.</a></small> 
                            </label>
                        </div>
                        <div class="col-md-12 col-sm-12 terms-conditions">
                            <label for="newsletter">
                                <input type="checkbox" name="newsletter" value="1">
                                <small> Pretendo subscrever a newsletter da HEALTHY Diet.</small> 
                            </label>
                        </div>
                    </div>

                <?php echo validation_errors('<span class="error">', '</span>');?>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 btn-register">
                            <button class="add_to_cart_button floatright" id="sbtRegister">Registar</button>
                        </div>
                    </div>                    
                </div>
            </div>
        <?php echo form_close(); ?>
        <!--</form>-->
    </div>
</div>
        