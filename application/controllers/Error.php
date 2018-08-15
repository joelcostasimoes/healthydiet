<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Error extends  App {
     public function __construct()
    {
        parent::__construct();
    }
	public function index()
	{  
		$this->data_view['title']='Página indisponível - HEALTHYDiet';
		$this->loadTemplate('errors/html/error_404', $this->data_view);
	}
}
