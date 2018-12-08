<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . 'controllers/App.php';
class Contacts extends  App {
    public function __construct()
    {
        parent::__construct();

        $this->load->helper(array('form', 'security'));
        $this->load->library(array('session','form_validation'));
        $config = array(
            'protocol' => 'smtp',
            'mailtype' => 'html',
            'smtp_host' => 'mail.socialmm.pt',
            'smtp_port' => 25,
            'smtp_user' => 'geral@socialmm.pt',
            'smtp_pass' => '249321761',
            'smtp_timeout' => '30',
            'charset' => 'utf-8'
        );
        $this->load->library('email');
        $this->email->initialize($config);
        $this->email->set_newline("\r\n");
        $this->load->model('user_logged_model');
        $this->load->model('contact_model');
        $this->data_view['user_logged']=FALSE;
        if ($this->session->userdata('user_logged')) {
            $this->data_view['user_logged']=$this->session->userdata('user_logged');
        }
    }
    public function index()
    {
        $this->data_view['title']='Contactos - Nutribem';
        $this->loadTemplate('contacts/contact', $this->data_view);
    }
    public function whereWeAre(){
        $this->data_view['title']='Onde estamos - Nutribem';
        $this->loadTemplate('contacts/whereWeAre', $this->data_view);
    }

    public function services(){
        $this->data_view['title']='Serviçoes/Tratamentos - Nutribem';
        $this->loadTemplate('contacts/services', $this->data_view);
    }

    public function contact()
    {
        $this->form_validation->set_rules($this->contact_model->config);
        if ($this->form_validation->run() == TRUE) {
            //envio de email para administrador
            $subject=$this->input->post('subject');
            $this->sendEmail('', $this->input->post('name'), $this->input->post('email'), 'geral@healthydiet.pt', $this->input->post('message'), 'pedidoContactoAdmin', $subject, 'clientes@healthydiet.pt');
            //envio de email para utilizador
            $subject="Pedido de Infromação";
            $this->sendEmail('', $this->input->post('name'), '', $this->input->post('email'), '', 'pedidoContactoUser', $subject, 'geral@healthydiet.pt');
            $data['error']=FALSE;
            $data['message']='Mensagem enviada com sucesso!';
            echo json_encode($data);
        }else{
            $data['message']=validation_errors();
            $data['error']=TRUE;
            echo json_encode($data);
        }

    }
}

