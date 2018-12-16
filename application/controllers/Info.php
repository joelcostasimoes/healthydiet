<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Info extends  App {
 public function __construct(){
    parent::__construct();
    $this->load->library(array('session'));
}

public function suggestionsComplaints(){
    $this->data_view['title']='Sugestões e Reclamações - Nutribem';
    $this->loadTemplate('info/suggestionsComplaints', $this->data_view);
}

public function conflits(){
    $this->data_view['title']='Resolução Alternativa de Conflitos - Nutribem';
    $this->loadTemplate('info/conflits', $this->data_view);
}

public function paymentMethod(){
    $this->data_view['title']='Método de Pagamento - Nutribem';
    $this->loadTemplate('info/paymentMethod', $this->data_view);
}

public function transportsDelivery(){
    $this->data_view['title']='Portes/Entrega - Nutribem';
    $this->loadTemplate('info/transportsDelivery', $this->data_view);
}

public function services(){
    $this->data_view['title']='Serviços - Nutribem';
    $this->loadTemplate('info/services', $this->data_view);
}

public function returnsExchanges(){
    $this->data_view['title']='Devoluções e Trocas - Nutribem';
    $this->loadTemplate('info/returnsExchanges', $this->data_view);
}

public function whoWeAre(){
    $this->data_view['title']='Quem Somos - Nutribem';
    $this->loadTemplate('info/whoWeAre', $this->data_view);
}
}
