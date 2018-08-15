<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class TermsOfUse extends  App {
     public function __construct()
    {
        parent::__construct();
        $this->load->library(array('session'));
    }
	public function index()
	{  
		$this->data_view['title']='Termos e Condições - HEALTHYDiet';
		$this->load->view('termsOfUse');
	}
}