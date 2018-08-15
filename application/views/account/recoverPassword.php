<div class="single-product-area" ng-controller="newPassword">
    <div class="container recoverPassword">
        <h2 class="sidebar-title col-md-12 col-sm-12 col-xs-12">Recuperar password</h2>
        <div class="col-md-6 floatLeft divLeft">    
            <div class="col-md-6 floatLeft">  
                <p>Nova Password</p>
                <p>Comfirmar Password</p>
                <p>Email</p>
                <p>Codigo</p>
            </div>
            <div class="col-md-6 floatLeft">  
                <input type="password" name="password" placeholder="" ng-model="password">
                <input type="password" name="confirmPassword" placeholder="" ng-model="confirmPassword">
                <input type="email" name="email" placeholder="" ng-model="email">
                <input type="text" name="cod" placeholder="a1b2" ng-model="cod">
                </div>  
            <div class="error"></div> 
            <div class="success"></div> 
            <button type="button" class="add_to_cart_button btn_find" ng-click="newPassword()">Recuperar Password</button>   
        </div>
        <div class="col-md-6 floatLeft">
            <small>Para concluir este processo terá de introduzir uma nova password nos dois campos abaixo disponiveis, o email associado à sua conta e código que lhe foi fornecido no email enviado.</small>
        </div>
    </div>
</div>