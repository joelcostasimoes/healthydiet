<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Auth extends  App {
    private $error;

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form','url','security','file'));
        $this->load->library('session');
        
        $this->load->database();
        $this->load->model('auth_model');
        $this->load->library('common_helper');
        $this->load->library('user_agent');
        $this->controller = strtolower(get_class($this));
        $this->data_view['user_logged']=FALSE;
        if ($this->session->userdata('user_logged')) {
            $this->data_view['user_logged']=$this->session->userdata('user_logged');
        }
    }
    public function index()
    {
        $email = $this->input->post('email_login');
        $password = $this->input->post('password_login');
        $data_view['error']=$this->auth_model->login($email, $password);
        if($data_view['error']==null){
            redirect($this->agent->referrer(), 'refresh');
            exit();
        }else{
            $this->session->set_flashdata('data_view',$data_view); 
            redirect($this->agent->referrer(), 'refresh');
            exit();
        }
    }

    public function logout(){
        $this->session->unset_userdata('user_logged');
        redirect($this->agent->referrer(), 'refresh');
        exit();
    }
}
