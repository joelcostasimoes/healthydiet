var app = angular.module('healthyDiet', ["bw.paging"]);
app.filter('offset', function() {
    return function(input, start) {
        start = parseInt(start, 10);
        return input.slice(start);
    };
});
app.controller('listProducts', function($scope, $log, $http) {
    $scope.mdlCategory = [''];
    $scope.mdlPathology = [''];
    $scope.count = [''];
    $scope.order = ['id', false, 'name', false, 'name', true, 'price', false, 'price', true];
    $scope.mdlGender = {
        val: ''
    };
    $scope.mdlAge = {
        val: ''
    };
    $scope.valuesOption = [{
        'id': 0,
        'name': '--'
    }, {
        'id': 2,
        'name': 'Nome de produto: A-Z'
    }, {
        'id': 4,
        'name': 'Nome de produto: Z-A'
    }, {
        'id': 6,
        'name': 'Preço: o mais barato primeiro'
    }, {
        'id': 8,
        'name': 'Preço: o mais caro primeiro'
    }]
    $scope.index = 0;
    var str;
    $(".toogle_filter").click(function() {
        $(this).next("ul").slideToggle('slow');
    });
    $scope.filterCategory = function(element) {
        if ($scope.mdlCategory.length > 0) {
            str = '';
            for (var i = 0; i < $scope.mdlCategory.length; i++) {
                if ($scope.mdlCategory[i] != false && $scope.mdlCategory[i] != null) {
                    if (str == '') str = $scope.mdlCategory[i];
                    else str += ".*" + $scope.mdlCategory[i];
                }
            }
            return element.category.match(new RegExp(str, 'g')) ? true : false;
        } else {
            return true;
        }
    };
    $scope.filterPathology = function(element) {
        if ($scope.mdlPathology.length > 0) {
            str = '';
            for (var i = 0; i < $scope.mdlPathology.length; i++) {
                if ($scope.mdlPathology[i] != false && $scope.mdlPathology[i] != null) {
                    if (str == '') str = $scope.mdlPathology[i];
                    else str += ".*" + $scope.mdlPathology[i];
                }
            }
            return element.pathology.match(new RegExp(str, 'g')) ? true : false;
        } else {
            return true;
        }
    };
    $scope.selectProduct = function(product) {
        $scope.productSelected = product;
    };
    /*function getListProducts() {
        console.log($scope.category);
        if ($scope.category > 0) {
            $http({
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                url: 'http://localhost:8080/nutritionWellness/product/getProductsByCategoriesProducts',
                method: "POST",
                data: $.param({
                    "category": $scope.category
                }),
            }).success(function(data, status, headers, config) {
                $scope.products = data;
                console.log(data);
            }).error(function(result) {
                console.log('false');
            });
        } else {
            $http({
                method: 'POST',
                url: 'http://localhost:8080/nutritionWellness/product/getall',
            }).success(function(data, status, headers, config) {
                console.log(data);
                $scope.products = data;
                
            }).error(function(result) {
                console.log('false');
            });
        }
        console.log("ola");
    }*/
    $scope.changePage = function(page) {
        console.log(page + "pagina");
    };
    $(document).ready(function() {
        //console.log($scope.category);
        //getListProducts();
    });
});
app.controller('product', function($scope, $log, $http) {
    $scope.mdlCategory = [''];
});
app.controller('register', function($scope, $http) {
    $("#formRegister").validate({
        rules: {
            fname: {
                required: true,
                maxlength: 150
            },
            lname:{
                required: true,
                maxlength: 150
            },
            email: {
                required: true,
                email: true,
                maxlength: 80,
                remote: {
                    url: "http://localhost:8080/nutritionWellness/verifyEmail",
                    type: "post"
                }
            },
            phone: {
                minlength: 9,
                maxlength: 11,
                number: true
            },
            mobile: {
                minlength: 9,
                maxlength: 11,
                number: true
            },
            nif: {
                required: true,
                minlength: 9,
                maxlength: 9
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 150
            },
            cpassword: {
                equalTo: "#password",
                maxlength: 150
            },
            faddress: {
                required: true,
                minlength: 3,
                maxlength: 300
            },
            fzipNumber: {
                required: true,
                minlength: 3,
                maxlength: 300
            },
            fzipName: {
                required: true,
                minlength: 3,
                maxlength: 100
            },
            fcity: {
                required: true,
                minlength: 3,
                maxlength: 100
            },
            eaddress: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                maxlength: 300
            },
            ezipNumber: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                maxlength: 300
            },
            ezipName: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                maxlength: 100
            },
            ecity: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                maxlength: 100 
            },
            terms: {
                required: true
            },
        },
        messages: {
            terms: {
                required: "Precisa de aceitar os termos e condições para poder efetuar o registo."
            }
        }
    });
});
app.controller('account', function($scope, $log, $http) {
    $scope.mdlCategory = [''];
});
app.controller('checkout', function($scope, $log, $http) {
    $scope.typePayment = {
        value: 2
    };
});