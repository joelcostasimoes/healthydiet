<?php 
require_once APPPATH . 'models/App_model.php';

class User_logged_model extends App_model {
    var $id;
    var $fname;
    var $lname;
    var $email;
    var $type;
    var $token;
    public function __construct($id="",$fname="",$lname="",$email="",$type="cliente") {
        parent::__construct();
        $this->id = $id;
        $this->fname = $fname;
        $this->lname = $lname;
        $this->email = $email;
        $this->token=sha1($email . microtime() . rand());
        $this->type = $type;
    }
}






