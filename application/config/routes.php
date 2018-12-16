<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'home';
$route['home'] = 'home';

//$route['products'] = 'product/products';
//$route['products/(:num)'] = 'product/productsByCategories/$1';


//$route['product/getProductsByCategoriesProducts'] = 'product/getProductsCategories';
$route['product/(:num)'] = 'product/product/$1';

//$route['product/(:num)'] = 'product/productDetail/$1';
$route['createOrder'] = 'account/createOrder';
$route['termsOfUse'] = 'termsOfUse';
$route['products'] = 'product/products';
$route['products/(:any)/(:any)'] = 'product/products/$1/$2';
$route['products/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4';
$route['products/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4/$5/$6';
$route['products/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4/$5/$6/$7/$8';
$route['products/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4/$5/$6/$7/$8/$9/$10';
$route['products/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4/$5/$6/$7/$8/$9/$10/$11/$12';
$route['products/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = 'product/products/$1/$2/$3/$4/$5/$6/$7/$8/$9/$10/$11/$12/$13/$14';
$route['getProducts'] = 'product/getProducts';
$route['contacts'] = 'contacts';
$route['whereWeAre'] = 'contacts/whereWeAre';
$route['services'] = 'info/services';

$route['suggestionsComplaints'] = 'info/suggestionsComplaints';
$route['conflits'] = 'info/conflits';
$route['paymentMethod'] = 'info/paymentMethod';
$route['transportsDelivery'] = 'info/transportsDelivery';
$route['returnsExchanges'] = 'info/returnsExchanges';
$route['whoWeAre'] = 'info/whoWeAre';

$route['register'] = 'account';
$route['verifyEmail'] = 'account/verifyEmail';
$route['createAccount'] = 'account/createAccount';
$route['updateAccount'] = 'account/updateAccount';

$route['account'] = 'account/myAccount';
$route['requestNewPassword'] = 'account/requestNewPassword';
$route['recoverPassword'] = 'account/recoverPassword';
$route['recoverPassword'] = 'account/recoverPassword';
$route['newPassword'] = 'account/newPassword';

$route['account/(:any)'] = 'account/myAccount/$1';
$route['addToCard'] = 'account/addToCard';
$route['updateCard'] = 'account/updateCard';
$route['login'] = 'auth';
$route['email/(:any)'] = 'account/email/$1';
$route['subscriveNewsletter'] = 'account/subscriveNewsletter';
$route['logout'] = 'auth/logout';
$route['active/(:num)/(:any)'] = 'account/activeAccount/$1/$2';
$route['unsubscriveNewsletter/(:any)'] = 'account/unsubscriveNewsletter/$1';
$route['checkout'] = 'account/checkout';
$route['contactUs'] = 'contacts/contact';
$route['invoice/(:any)'] = 'account/invoice/$1';
$route['receipt/(:any)'] = 'account/receipt/$1';
$route['calculateTransporte'] = 'account/calculateTransporte';



$route['404_override'] = 'error';
$route['translate_uri_dashes'] = FALSE;




//admin

$route['admin'] = 'admin';
$route['admin/login'] = 'admin/login';
