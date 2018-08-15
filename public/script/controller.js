var app = angular.module('healthyDiet', ['dcbImgFallback']);
var base_url = 'http://socialmm.pt/healthydiet/';
app.filter('offset', function() {
    return function(input, start) {
        start = parseInt(start, 10);
        return input.slice(start);
    };
});
app.controller('listProducts', function($scope, $log, $http) {
    $scope.loading = true;
    $scope.getNumberProducts = function(num) {
        return new Array(num);
    }
    $scope.findProducts = function(page) {
        if (page == undefined) page = 1;
        $scope.loading = true;
        $scope.currentPage = page;
        var config_list_products = {};
        var i = 0;
        $.each($scope.mdlCategory, function(k, v) {
            if (v >= 0 && v <= $scope.mdlCategory.length && v != '') {
                if (i == 0) {
                    config_list_products['categories'] = v;
                    i++;
                } else {
                    config_list_products['categories'] += "-" + v;
                }
            }
        });
        i = 0;
        $.each($scope.mdlPathology, function(k, v) {
            if (v >= 0 && v <= $scope.mdlPathology.length && v != '') {
                if (i == 0) {
                    config_list_products['pathologies'] = v;
                    i++;
                } else {
                    config_list_products['pathologies'] += "-" + v;
                }
            }
        });
        if ($scope.mdlAge['val'] >= 0) {
            config_list_products['age'] = $scope.mdlAge['val'];
        }
        if ($scope.mdlGender['val'] >= 0) {
            config_list_products['gender'] = $scope.mdlGender['val'];
        }
        $.ajax({
            url: base_url + "getProducts",
            type: "POST",
            data: {
                keyword: $scope.keyword,
                categories: config_list_products['categories'],
                pathologies: config_list_products['pathologies'],
                age: config_list_products['age'],
                gender: config_list_products['gender'],
                order: $scope.orderIndex,
                limit: $scope.pageSize,
                page: page
            },
            dataType: 'json',
            'success': function(data) {
                $scope.total = data['numberProducts'];
                $scope.products = data['products'];
                $scope.numberPages = data['numberPages'];
                history.pushState({}, '', base_url+data['historic']);
                $scope.loading = false;
                $("html, body").animate({ scrollTop: 264 }, "slow");
                $scope.$apply();
            }
        });
    }
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
    $(document).ready(function() {
        $scope.loading = false;
        $scope.$apply();
    });
});
app.controller('product', function($scope, $log, $http) {
    $scope.mdlCategory = [''];
});
app.controller('register', function($scope, $http) {
    /*
    $("#sbtRegister").click(function(event){
        $scope.status= {'status':false};
        $.ajax({
            method: 'POST',
            url: 'http://localhost:8080/nutritionWellness/verifyEmail',
            data: {'email':$('#email').val()},
            datatype: "json",
        }).success(function(data, status, headers, config) {
            $scope.status = $.parseJSON(data);
        });
        if ($scope.status["status"]==true) {
            event.preventDefault();
        }else{
            event.preventDefault();
            //$("#formRegister").submit();
        }
    });
    var validator = $( "#formRegister" ).validate();
    validator.showErrors({
      "fname": "I know that your firstname is Pete, Pete!"
    });*/
    $("#formRegister").validate({
        rules: {
             nameCompany: {
                required: {
                    depends: function() {
                        return ($("#type").is(":checked"));
                    }
                },
                minlength: 3
            },
            fname: "required",
            lname: "required",
            email: {
                required: true,
                email: true,
                remote: {
                    url: base_url + "verifyEmail",
                    type: "post"
                }
            },
            phone: {
                minlength: 9,
                maxlength: 12,
                number: true
            },
            mobile: {
                minlength: 9,
                maxlength: 12,
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
            },
            cpassword: {
                equalTo: "#password",
            },
            faddress: {
                required: true,
                minlength: 3
            },
            fzipNumber: {
                required: true,
                minlength: 3,
                maxlength: 300
            },
            fzipName: {
                required: true,
                minlength: 3,
                number: false
            },
            fcity: {
                required: true,
                minlength: 3,
                number: false
            },
            eaddress: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3
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
                number: false
            },
            ecity: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                number: false
            },
            terms: {
                required: true
            },
        },
        messages: {
            fname: {
                required: "Campo de preenchimento obrigatório"
            },
            lname: {
                required: "Campo de preenchimento obrigatório",
            },
            email: {
                required: "Campo de preenchimento obrigatório",
                email: "Email inválido",
                remote: "Este email já existe na nossa base de dados"
            },
            phone: {
                minlength: "O telefone não pode conter menos 9 dígitos",
                maxlength: "O telefone não pode conter mais 12 dígitos",
                number: "O telefone só pode conter números"
            },
            mobile: {
                minlength: "O telefone não pode conter menos 9 dígitos",
                maxlength: "O telefone não pode conter mais 12 dígitos",
                number: "O telefone só pode conter números"
            },
            nif: {
                required: "Campo de preenchimento obrigatório",
                minlength: "O nif é constituido por 9 dígitos",
                maxlength: "O nif é constituido por 9 dígitos",
                number: "O nif só pode conter números"
            },
            password: {
                required: "Campo de preenchimento obrigatório",
                minlength: "A passoword tem de ter no minimo 6 caracteres"
            },
            cpassword: {
                equalTo: "As passowords têm de coincidir"
            },
            terms: {
                required: "Precisa de aceitar os termos e condições para poder efetuar o registo."
            }
        },
    });

/*$( "#sbtRegister" ).click(function() {
  alert($("#formRegister").valid());

});*/

});
app.controller('my-account', function($scope, $http) {
   $("#formUpdateAccount").validate({
        rules: {
            email: {
                email: true,
                remote: {
                    url: base_url + "verifyEmail",
                    type: "post"
                }
            },
            phone: {
                minlength: 9,
                maxlength: 12,
                number: true
            },
            mobile: {
                minlength: 9,
                maxlength: 12,
                number: true
            },
            nif: {
                minlength: 9,
                maxlength: 9
            },
            password: {
                minlength: 6,
            },
            cpassword: {
                equalTo: "#password",
            },
            faddress: {
                minlength: 3
            },
            fzipNumber: {
                required: true,
                minlength: 3,
                maxlength: 300
            },
            fzipName: {
                minlength: 3,
                number: false
            },
            fcity: {
                minlength: 3,
                number: false
            },
            eaddress: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3
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
                number: false
            },
            ecity: {
                required: {
                    depends: function() {
                        return !($("#typeAddress").is(":checked"));
                    }
                },
                minlength: 3,
                number: false
            }
        }
    });
});
app.controller('checkout', function($scope, $log, $http) {
    $scope.typePayment = {
        value: 2
    };
});
app.controller('cart', function($scope, $log, $http, $window) {
    if ($scope.card!=null) {
        $scope.itemLenght = $scope.card.lenght;
    }else{
        $scope.itemLenght=0;
    }
    $scope.removeItem = function(model) {
        $scope.update_total(model,0);
        $scope.card.splice(model,1);
        $scope.itemLength = $scope.card.length;

    };
    $scope.cancel = function() {
        $window.location.reload();
    };
    $scope.update_total = function($index,quantity) {
        $scope.card[$index].quantity=quantity;
        $scope.subTotal=0;
        angular.forEach($scope.card, function(item) {
            $scope.subTotal+=item.quantity*item.price;
        });
        $scope.subTotal=$scope.subTotal.toFixed(2);
    };
    
    
    $scope.addItem = function(quantity, idProduct) {
        var quantity = $scope.quantity[idProduct];
        $.ajax({
            url: base_url + "addToCard",
            type: "POST",
            data: {
                idProduct: idProduct,
                quantity: quantity
            },
            dataType: 'json',
            'success': function(data) {
                if (data['error'] == false) {
                    window.location.href = base_url + data['url'];
                } else {
                    $('#error-login').show('slow');
                    $('#error-login').text(data['error']);
                }
            }
        });
    }/*
*/});

app.controller('addToCard', function($scope, $log, $http) {
    $scope.addItem = function(idProduct, quantity) {
        if (quantity == undefined) {
            quantity = $scope.quantity[idProduct];
        }
        if (quantity > 0) {
            console.log(quantity + "teste");
            $.ajax({
                url: base_url + "addToCard",
                type: "POST",
                data: {
                    idProduct: idProduct,
                    quantity: quantity
                },
                dataType: 'json',
                'success': function(data) {
                    console.log(data.number_products);
                    $(".cart-amunt").text(data.total_card + "€");
                    $(".product-count").text(data.number_products);
                    createAlert('','Produto adicionado com successo','','success',true,true,'pageMessages', 4000);
                }
            });
        }
    }
});
app.controller('subscriveNewsletter', function($scope, $log, $http) {

    $scope.subscrive = function() {
        console.log($scope.terms);
        if ($scope.terms==true) {        
            $.ajax({
                url: base_url + "subscriveNewsletter",
                type: "POST",
                data: {
                    email: $scope.email,
                    terms: $scope.terms
                },
                dataType: 'json',
                'success': function(data) {
                    console.log(data);
                    createAlert('',data,'','success',true,true,'pageMessages', 30000);
                }
            });
        }else{
            createAlert('','Precisa de aceitar os termos e condiçoes.','','success',true,true,'pageMessages', 30000);
        }
    }
});
app.controller('info', function($scope, $log, $http,$timeout) {
    $scope.checkInfo = function(value) {
        if (value != null) {
            $('#infoModal').modal('show');
            $timeout(function() {
                 $('#infoModal').modal('hide')       
            }, 18000);
        }
    };
});
app.controller('login', function($scope, $log, $http) {
    $scope.checkLogin = function(value) {
        if (value != null) {
            $('#loginModal').modal('show');
        }
    };
    $scope.login = function() {
        var password = $scope.password;
        var email = $scope.email;
        $.ajax({
            url: base_url + "login",
            type: "POST",
            data: {
                email: email,
                password: password
            },
            dataType: 'json',
            'success': function(data) {
                if (data['error'] == false) {
                    window.location.href = base_url + data['url'];
                } else {
                    $('#error-login').show('slow');
                    $('#error-login').text(data['error']);
                }
            }
        });
    }
});
app.controller('recoverPassword', function($scope, $log, $http) {
    $scope.recoverPassword = function() {
        $('.waiting').show();
        $('.error').hide();
        $('.success').hide();
        var email = $scope.email;
        $.ajax({
            url: base_url + "requestNewPassword",
            type: "POST",
            data: {
                email: email
            },
            dataType: 'json',
            'success': function(data) {
                if (data['error'] == false) {
                    $('#recoverPasswordModal .error').hide();
                    $('#recoverPasswordModal .waiting').hide('slow');
                    $('#recoverPasswordModal .success').show('slow');
                    $('#recoverPasswordModal .success').text(data['message']);
                } else {
                    $('#recoverPasswordModal .success').hide();
                    $('#recoverPasswordModal .waiting').hide('slow');
                    $('#recoverPasswordModal .error').show('slow');
                    $('#recoverPasswordModal .error').text(data['message']);
                }
            }
        });
    }
});
app.controller('newPassword', function($scope, $log, $http) {
    $scope.newPassword = function() {
        console.log("teste");
        var email = $scope.email;
        var password = $scope.password;
        var confirmPassword = $scope.confirmPassword;
        var cod = $scope.cod;
        $.ajax({
            url: base_url + "newPassword",
            type: "POST",
            data: {
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                cod: cod
            },
            dataType: 'json',
            'success': function(data) {
                if (data['error'] == false) {
                    $('.recoverPassword .error').hide();
                    $('.recoverPassword .success').show('slow');
                    $('.recoverPassword .success').text(data['message']);
                } else {
                    $('.recoverPassword .success').hide();
                    $('.recoverPassword .error').show('slow');
                    $('.recoverPassword .error').text(data['message']);
                }
            }
        });
    }
});
app.controller('contact', function($scope, $log, $http) {

    $("#formContact").validate({
        rules: {
            name: {
                required: true,
                minlength: 3,
            },            
            email: {
                required: true,
                email: true
            },
            subject: {
                required: true,
                minlength: 3,
            },
            message: {
                required: true,
                minlength: 3,
            },
        },
        messages: {
            name: {
                required: "Campo de preenchimento obrigatório",
                minlength: "Este campo deve conter no minimo 3 caracteres"
            },
            email: {
                required: "Campo de preenchimento obrigatório",
                email: "Email inválido"
            },
            subject: {
                required: "Campo de preenchimento obrigatório",
                minlength: "Este campo deve conter no minimo 3 caracteres"
            },
            message: {
                required: "Campo de preenchimento obrigatório",
                minlength: "Este campo deve conter no minimo 3 caracteres"
            }
        },
        submitHandler: function(form) {
            $('.waiting').show();
            $('.error').hide();
            $('.success').hide();
            $.ajax({
            url: base_url + "contactUs",
            type: "POST",
            data: {
                email: $scope.email,
                name: $scope.name,
                subject: $scope.subject,
                message: $scope.message
            },
            dataType: 'json',
            'success': function(data) {
                console.log(data);
                if (data['error'] == false) {
                    $('#formContact .error').hide();
                    $('#formContact .waiting').hide('slow');
                    $('#formContact .success').show('slow');
                    $('#formContact .success').text(data['message']);
                    setTimeout(function(){
                        $('#formContact .waiting').hide();
                        $(this).closest('form').find("input[type=text], textarea").val("");
                    }, 1000);
                } else {
                    $('#formContact .success').hide();
                    $('#formContact .waiting').hide('slow');
                    $('#formContact .error').show('slow');
                    $('#formContact .error').text(data['message']);
                }
            }
        });
        }
    });
});

function createAlert(title, summary, details, severity, dismissible, autoDismiss, appendToId, time) {
        console.log("teste");
        var iconMap = {
            info: "fa fa-info-circle",
            success: "fa fa-thumbs-up",
            warning: "fa fa-exclamation-triangle",
            danger: "fa ffa fa-exclamation-circle"
        };
        var iconAdded = false;
        var alertClasses = ["alert", "animated", "flipInX"];
        alertClasses.push("alert-" + severity.toLowerCase());
        if (dismissible) {
            alertClasses.push("alert-dismissible");
        }
        var msgIcon = $("<i />", {
            "class": iconMap[severity] // you need to quote "class" since it's a reserved keyword
        });
        var msg = $("<div />", {
            "class": alertClasses.join(" ") // you need to quote "class" since it's a reserved keyword
        });
        if (title) {
            var msgTitle = $("<h4 />", {
                html: title
            }).appendTo(msg);
            if (!iconAdded) {
                msgTitle.prepend(msgIcon);
                iconAdded = true;
            }
        }
        if (summary) {
            var msgSummary = $("<strong />", {
                html: summary
            }).appendTo(msg);
            if (!iconAdded) {
                msgSummary.prepend(msgIcon);
                iconAdded = true;
            }
        }
        if (details) {
            var msgDetails = $("<p />", {
                html: details
            }).appendTo(msg);
            if (!iconAdded) {
                msgDetails.prepend(msgIcon);
                iconAdded = true;
            }
        }
        if (dismissible) {
            var msgClose = $("<span />", {
                "class": "close", // you need to quote "class" since it's a reserved keyword
                "data-dismiss": "alert",
                html: "<i class='fa fa-times-circle'></i>"
            }).appendTo(msg);
        }
        $('#' + appendToId).prepend(msg);
        if (autoDismiss) {
            setTimeout(function() {
                msg.addClass("flipOutX");
                setTimeout(function() {
                    msg.remove();
                }, 1000);
            }, time);
        }
    }
