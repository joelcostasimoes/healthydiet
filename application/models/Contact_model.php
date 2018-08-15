<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'models/App_model.php';

class Contact_model extends App_model {

    public function __construct() {
        parent::__construct();
        $this->config = array(
            array(
                'field' => 'name',
                'label' => 'Nome',
                'rules' => 'trim|required|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'email',
                'label' => 'Email',
                'rules' => 'trim|xss_clean|valid_email|max_length[80]'
            ),
            array(
                'field' => 'subject',
                'label' => 'Assunto',
                'rules' => 'trim|required|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'message',
                'label' => 'Mensagem',
                'rules' => 'trim|required|xss_clean|min_length[3]|max_length[1000]'
            )
        );
    }
}
