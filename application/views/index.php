    <div class="slider-area">
        <div class="zigzag-bottom"></div>
        <div id="owl-demo" class="owl-carousel tes">
          <div><img src="<?=base_url()?>/public/img/slide-1.jpg"></div>
          <div><img src="<?=base_url()?>/public/img/slide-1.jpg"></div>
          <div><img src="<?=base_url()?>/public/img/slide-1.jpg"></div>

        </div>
        </div>
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <h2 class="section-title">Marcas</h2>
                        <div>
                            <div class="col-md-3 box-info-home">
                                <p>Preço Baixo</p>
                                <img src="<?=base_url()?>public/img/euro.png">
                            </div>
                            <div class="col-md-3 box-info-home">
                                <p>Qualidade Garantida</p>
                                <img src="<?=base_url()?>public/img/medal.png">
                            </div>
                            <div class="col-md-3 box-info-home">
                                <p>Entrega em 48h</p>
                                <img src="<?=base_url()?>public/img/truck.png">
                            </div>
                            <div class="col-md-3 box-info-home">
                                <p>Portes Gratis > 30€</p>
                                <img src="<?=base_url()?>public/img/box.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->

    <div class="product-widget-area">
        <div class="zigzag-bottom"></div>
        <div class="container" ng-init="products=<?php echo $products; ?>;">
            <div class="row">
                <div class=" col-md-12">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Os produtos mais vendidos do momento!</h2>
                        <div class="col-lg-4 col-md-4 col-sd-12 single-wid-product" ng-repeat="product in products">
                            <a href="<?=base_url()?>product/{{product.id}}"><img src="<?=base_url()?>/public/img/products/{{product.id}}.png" alt="" class="product-thumb"></a>
                            <h2><a href="<?=base_url()?>product/{{product.id}}">{{product.name}}</a></h2>
                            <div class="product-wid-price">
                                <ins>{{product.price}}€</ins>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End product widget area -->

