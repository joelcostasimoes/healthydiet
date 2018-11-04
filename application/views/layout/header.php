
<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-menu">
                    <ul>
                        <?php if($user_logged!=FALSE){ ?>
                            <li><a href="<?=base_url()?>account"><i class="fa fa-user"></i> Minha Conta</a></li>
                            <li><a href="<?=base_url()?>logout" ><i class="fa fa-sign-out"></i> Sair</a></li>
                        <?php }else { ?>
                            <li><a href="<?=base_url()?>register"><i class="fa fa-user-plus"></i> Registar</a></li>
                            <li><a href="" data-toggle="modal" data-target="#loginModal"><i class="fa fa-sign-in"></i> Entrar</a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->
<?php if($user_logged==FALSE){ ?>
    <div ng-controller="login" ng-init="checkLogin(error=<?php echo htmlspecialchars(json_encode($error)); ?>)">
        <div class="modal fade " id="loginModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="<?=base_url()?>login" method="post" accept-charset="utf-8" id="formLogin">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Entrar</h4>
                        </div>
                        <div class="modal-body">
                            <div class="div-login">
                                <label>Email</label>
                                <input type="email" id="email_login" name="email_login" ng-model="email" placeholder="Introduza o seu email">
                            </div>
                            <div class="div-login">
                                <label>Password</label>
                                <input type="password" id"password_login" name="password_login" ng-model="password">
                            </div>
                            <label id="error-login" ng-class="{'show' : error!=null}">{{error}}</label>
                            <a href="#" data-toggle="modal" data-target="#recoverPasswordModal" data-dismiss="modal">Esqueceu-se da sua password?</a>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="add_to_cart_button" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="add_to_cart_button">Entrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="recoverPasswordModal" tabindex="-1" role="dialog" ng-controller="recoverPassword">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Recuperar Password</h4>
        </div>
        <div class="modal-body">
            <div class="div-login">
                <label>Email</label>
                <input type="email" placeholder="Introduza o seu email" ng-model="email">
            </div>
            <div class="waiting"></div>
            <div class="error"></div>
            <div class="success"></div>
        </div>
        <div class="modal-footer">
            <button type="button" class="add_to_cart_button" data-dismiss="modal">Cancelar</button>
            <button type="button" class="add_to_cart_button" ng-click="recoverPassword()">Recuperar Password</button>
        </div>
    </div>
</div>
</div>
<?php }
if($info!=null and $info!=''){ ?>
    <div ng-controller="info" ng-init="checkInfo(info=<?php echo htmlspecialchars(json_encode($info)); ?>)">
        <div class="modal fade " id="infoModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel"><?php echo $titleInfo; ?></h4>
                    </div>
                    <div class="modal-body">
                        <label>
                            <i class="fa fa-thumbs-up"></i> <?php echo $info; ?></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                    <div class="logo">
                        <h1>
                            <a href="<?=base_url()?>">
                                <img src="<?=base_url()?>public/img/logo.png" alt="" class="img-logo" >
                                <span class="title-one">Nutri</span><span class="title-two">Bem</span>
                            </a>
                        </h1>
                    </div>
                </div>
                <?php if($user_logged!=FALSE){ ?>
                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                        <div class="shopping-item">
                            <a href="<?=base_url()?>account/cart">Carrinho de Compras - <span class="cart-amunt"><?php echo $card_header['total_card']; ?> €</span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><?php echo $card_header['number_products']; ?></span></a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div> <!-- End site branding area -->
    <div id="pageMessages" class="col-md-3 col-lg-3 col-sm-6 col-xs-12">

    </div>
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="<?=base_url()?>products">Alimentação</a>
                        </li>
                        <li>
                            <a href="<?=base_url()?>products">Suplementação</a>
                        </li>
                        <li>
                            <a href="<?=base_url()?>products">Cosmética</a>
                        </li>
                        <li>
                            <a href="<?=base_url()?>contacts">Contactos</a>
                        </li>
                    </ul>
                    <div class="box-search floatright">
                        <form action="<?=base_url()?>products" method="post" accept-charset="utf-8">
                            <div class="floatright">
                                <input class="txt-search" name="txtSearch" type="text">
                                <button type="submit" name="sbt-search" class="sbt-search" ><span><i class="fa fa-search"></i> Procurar</span></button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>


