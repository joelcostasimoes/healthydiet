<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Home extends  App {
     public function __construct()
    {
        parent::__construct();
        $this->load->library(array('session'));
        $this->load->model('user_logged_model');
    }
	public function index()
	{  
		$this->data_view['products'] =$this->user_logged_model->topSellingProducts();
        $this->loadTemplate('index', $this->data_view);
	}
}
