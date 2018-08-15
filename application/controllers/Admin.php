<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Admin extends  App {
     public function __construct()
    {
        parent::__construct();
        $this->load->library(array('session'));
        $this->load->model('user_logged_model');
    }
	public function index()
	{  
        $this->loadTemplate('admin/index','');
	}
    public function login()
    {  
        $this->load->view('admin/login');
    }
}
