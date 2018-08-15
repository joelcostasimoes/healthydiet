<?php 

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'models/App_model.php';

class User_model extends App_model {
    var $id;
    var $fname;
    var $lname;
    var $email;
    var $password;
    var $nif;
    var $mobile;
    var $phone;
    var $token;
    public function __construct($id="",$fname="",$lname="",$email="",$password="",$nif="",$mobile=000000000,$phone=000000000, $type=1) {
        parent::__construct();
        $this->id = $id;
        $this->fname = $fname;
        $this->lname = $lname;
        $this->email = $email;
        $this->password = $password;
        $this->nif = $nif;
        $this->mobile = $mobile;
        $this->phone = $phone;
        $this->type = $type;
        $this->token=sha1($email . microtime() . rand());
    }
}






