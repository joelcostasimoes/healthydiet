<?php 

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'models/App_model.php';

class Auth_model extends App_model {
    public function __construct() {
        parent::__construct();
        $this->tableName = "user";
    }    
    public function login($email, $password){
        $password = sha1($password);
        $condition = array('email' => $email, 'password' => $password);
        $row=$this->find($condition)->row();

        if($row){
            if ($row->status==1 || $row->status==2) {
              $session_user = array(
                            'fname'=> $row->fname,
                            'id'=> $row->id,
                            'lname'=>$row->lname,
                            'email'=> $row->email,
                            'token'=>$this->createToken($email),
                            'type'=> $row->type,
                            'logged_in'=>TRUE
                        );
                $set = array('token' => $session_user['token'], 'status' => 1);
                $this->change($set, $condition);
                $this->session->set_userdata('user_logged', $session_user);
                $this->session->userdata('historic_last_page');
                return null;
            }else{
                return 'Para efectuar o login tem de activar a sua conta. ';
            }
        }else{
            return 'Email e/ou password incorrectos. Tente novamente. ';
        }
    }     
    public function isLoggedIn(){
        header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
        $User = $this->session->userdata('user_logged');
        $condition = array('email' => $User['email'], 'token' => $User['token']);
        $row=$this->find($condition)->row();
        if(!$row && (!isset($User) || $User['logged_in']!==TRUE))
        {
            redirect('/');
            exit;
        }
    }
    public function isNotLoggedIn(){
        header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
        $User = $this->session->userdata('user_logged');
        if($User['logged_in']===TRUE)
        {
            redirect('/');
            exit;
        }
    }
}






