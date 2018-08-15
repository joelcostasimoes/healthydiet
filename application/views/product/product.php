   
    <div class="single-product-area" ng-controller="product">
        <div class="container" ng-init="product=<?php echo $product; ?>;relatedProducts=<?php echo $relatedProducts; ?>;">   
            <div class="row">        
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="product-breadcroumb col-md-12">
                            <a href="<?php echo $historic;?>" class="floatright">Voltar</a>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="product-images">
                                    <div class="product-main-img">
                                        <div class="discount-round" ng-show="product.discount>0">
                                            -{{product.discount}}%
                                        </div>
                                        <img ng-src="<?=base_url()?>public/img/products/{{product.id}}.png" alt="" fallback-src="<?=base_url()?>public/img/products/default.png">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-8">
                                <div class="product-inner">
                                    <h2 class="product-name">{{product.name}}</h2>
                                    <div class="product-inner-price">
                                        <ins>{{product.price}} €</ins>
                                        <del>{{product.original_price}} €</del>
                                    </div>    
                                    <?php if($user_logged!=FALSE){ ?>
                                    <form action="" class="frm-cart-product" >
                                        <div class="quantity row " ng-controller="addToCard">
                                            <input type="number" size="4" class=" floatleft input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1" ng-model="quantity" ng-init="quantity=1">
                                            <button class="add_to_cart_button glyphicon glyphicon-shopping-cart floatleft" type="button" ng-click="addItem(product.id, quantity)"> <span>Adicionar</span></button>
                                        </div>
                                    </form>   
                                    <?php } ?>
                                    <div class="tab-content">
                                        <div>
                                            <p>{{product.summary}}</p>
                                        </div>
                                    </div>
                                    <div class="tab-content">
                                        <div>
                                            <h2>Ingredientes</h2> 
                                            <p>{{product.ingredients}}</p>
                                        </div>
                                    </div>                    
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2>Mais Informações</h2>  
                                 <p>{{product.description}}</p>
                            </div>
                        </div>
                        <hr class="line-related-products" ng-show="relatedProducts.length>0">
                        <div class="related-products-wrapper" ng-show="relatedProducts.length>0" ng-class="{navIsHidden: relatedProducts.length<2}">
                            <h2 class="related-products-title">Produtos Relacionados</h2>
                            <div class="related-products-carousel" >
                                <div ng-repeat="relatedProduct in relatedProducts track by $index">
                                <div class="single-product">
                                    <div class="product-f-image product-upper">
                                        <div>
                                            <div class="discount-round" ng-show="product.discount>0">
                                                -{{product.discount}}%
                                            </div>
                                            <img src="<?=base_url()?>public/img/products/{{relatedProduct.id}}.png" alt="">
                                            <div class="product-hover">
                                                <a href="<?=base_url()?>product/{{relatedProduct.id}}" class="view-details-link"><i class="fa fa-link"></i> Ver Mais</a>
                                            </div>
                                        </div>
                                    </div>

                                    <h2><a href="<?=base_url()?>product/{{relatedProduct.id}}">{{relatedProduct.name}}</a></h2>

                                    <div class="product-carousel-price">
                                        <ins>{{relatedProduct.price}} €</ins> <del>{{relatedProduct.original_price}} €</del>
                                    </div> 
                                    </div>
                                </div>                                 
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>