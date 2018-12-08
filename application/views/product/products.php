
<div class="single-product-area" ng-controller="listProducts" >
    <div class="container" ng-init="loading=true;keyword=<?php echo $keyword; ?>;mdlbrand=<?php echo $brandsChecked; ?>;mdlCategory=<?php echo $categoriesChecked; ?>;orderIndex='<?php echo $order; ?>';pageSize='<?php echo $limit; ?>'; products=<?php echo $products; ?>; brands=<?php echo $brands; ?>; categories=<?php echo $categories; ?>; currentPage=<?php echo $currentPage; ?>; total=<?php echo $numberProducts; ?>; numberPages=<?php echo $numberPages; ?>;">
        <div class="row">
            <div class="col-md-3 col-sm-12 col-xs-12 filters">
                <form name="Form">
                    <a class="clean-filter" href="<?=base_url()?>products"><span >Limpar filtros   <i class="fa fa-times-circle" aria-hidden="true"></i></span></a>
                    <hr>
                    <p ng-hide="keyword==null" class="show_keyword">Resultados da pesquisa por: '{{keyword}}'</p>
                    <hr ng-hide="keyword==null">
                    <p class="toogle_filter">Marca: <span>+</span></p>
                    <ul class="col-md-12 col-sm-12 col-xs-12 ul_filter" >
                        <li ng-repeat="brand in brands track by $index">
                            <label for="brand_{{brand.id}}">
                                <input type="checkbox" id="brand_{{brand.id}}"
                                ng-model="mdlBrand[$index]"
                                ng-true-value="'{{brand.id}}'"
                                ng-false-value="''">
                                <span>{{brand.name}} </span>
                            </label>
                        </li>
                    </ul>

                    <hr>
                    <p class="toogle_filter">Categoria: <span>+</span></p>
                    <ul class="col-md-12 col-sm-12 col-xs-12 ul_filter" >
                        <li ng-repeat="category in categories track by $index | limitTo: 1">
                            <label for="category_{{category.id}}">
                                <input type="checkbox"  id="category_{{category.id}}"
                                ng-model="mdlCategory[$index]"
                                ng-true-value="'{{category.id}}'"
                                ng-false-value="''">
                                <span>{{category.name}} </span>
                            </label>
                        </li>
                    </ul>
                    <hr>
                    <button class="add_to_cart_button btn_find" ng-click="findProducts()"><span>Procurar</span></button>
                </form>
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12 clearfix:after"  ng-init="count=0">
                <div class="col-md-12 col-sm-12 col-xs-12 orde_npage">
                    <div class="floatleft">
                        Ordenar por
                        <select ng-model="orderIndex" ng-change="findProducts()">
                            <option value="0" >--</option>
                            <option value="1" >Nome de produto: A-Z</option>
                            <option value="2" >Nome de produto: Z-A</option>
                            <option value="3" >Preço: o mais caro primeiro</option>
                            <option value="4" >Preço: o mais barato primeiro</option>
                        </select>
                    </div>
                    <div class="floatleft hidden-xs hidden-s">
                        Mostrar
                        <select ng-model="pageSize" ng-change="findProducts()">
                            <option value="9" > 9 </option>
                            <option value="15" > 15 </option>
                            <option value="24" > 24 </option>
                            <option value="36" > 36 </option>
                        </select>
                        por página.
                    </div>
                    <div class="floatright hidden-xs hidden-s">
                        Produtos encontrados: {{total}}
                    </div>
                </div>
                <div class="container_loader" ng-show="loading==true">
                    <div class="box">
                        <div class="loader"></div>
                    </div>
                </div>
                <div class="col-md-12 not_found" ng-show="total==0">
                    De momento, não dispomos de resultados que correspondam à sua pesquisa.
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6" ng-repeat="product in products" ng-show="loading==false && total>0">
                    <div class="single-shop-product">
                        <a href="<?=base_url()?>product/{{product.id}}">
                            <div class="product-upper">
                                <div>
                                    <div class="discount-round" ng-show="product.discount>0">
                                            -{{product.discount}}%
                                    </div>
                                    <img ng-src="<?=base_url()?>public/img/products/{{product.id}}.png" alt="" fallback-src="<?=base_url()?>public/img/products/default.png">
                                </div>
                            </div>
                        </a>
                        <h2><a href="<?=base_url()?>product/{{product.id}}">{{product.name}}</a></h2>
                        <div class="row" ng-controller="addToCard">
                            <div class="product-carousel-price col-md-6 col-sm-6">
                                <ins>{{product.price}} €</ins>
                            </div>
                            <div class="product-carousel-price col-md-6 col-sm-6">
                                <del>{{product.original_price}} €</del>
                            </div>
                            <?php if($user_logged!=FALSE){ ?>
                            <form action="" class="cart col-md-5 col-sm-5 col-xs-5">
                                <div class="quantity">
                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1" ng-model="quantity[product.id]" ng-init="quantity[product.id]=1">
                                </div>
                            </form>
                            <div class="product-option-shop col-md-7 col-sm-7 col-xs-7">
                                <button class="add_to_cart_button glyphicon glyphicon-shopping-cart" ng-click="addItem(product.id)"><span>Adicionar</span></button>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                <!--<div paging page="currentPage" page-size="pageSize" total="filteredProducts.length" show-prev-next="true" show-first-last="true" text-next-class="glyphicon glyphicon-chevron-right" text-prev-class="glyphicon glyphicon-chevron-left" text-first-class="glyphicon glyphicon-backward" text-last-class="glyphicon glyphicon-forward" hide-if-empty="true" paging-action="changePage(page)" >
                    --><ul class="pagination">
                        <li ng-repeat="page in getNumberProducts(numberPages) track by $index" ng-class="{'active': $index+1== currentPage} ">
                            <span ng-click="findProducts($index+1)">{{$index+1}}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
