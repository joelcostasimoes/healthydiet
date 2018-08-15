<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'controllers/App.php';
class Account extends App {
    private $error;

    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url', 'security', 'file'));
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
        $this->load->library('email', $config);
        $this->load->library(array('session', 'form_validation','common_helper'));
//$this->load->library(array('session', 'form_validation','common_helper','pdf'));

        $this->load->database();
        $this->load->model('account_model');
        $this->load->model('address_model');
        $this->load->model('auth_model');
        $this->load->model('user_model');
        $this->load->model('user_logged_model');

        $this->controller = strtolower(get_class($this));
    }

    public function index() {
        $this->auth_model->isNotLoggedIn();
        $this->data_view['data_countries'] = $this->account_model->countries;
        $this->data_view['title']='Criar nova conta de cliente - HEALTHYDiet';
        $this->loadTemplate('account/register', $this->data_view);
    }


    public function myAccount($page=NULL) {
        $this->auth_model->isLoggedIn();

        $this->data_view['data_user'] = $this->account_model->getDataUser($this->data_view['user_logged']['id']);
        $condition['email'] = $this->data_view['user_logged']['email'];
        $this->data_view['newsletter'] = $this->account_model->find($condition,'newsletter')->row();
        $this->data_view['data_orders'] = $this->account_model->getMyOrders($this->data_view['user_logged']['id'], 0);
        $this->data_view['data_pending_orders'] = $this->account_model->getMyOrders($this->data_view['user_logged']['id'], 1);
        
        $this->data_view['data_card'] = htmlspecialchars(json_encode($this->account_model->getMyCard($this->data_view['user_logged']['id'])));
        $this->data_view['sub_total'] = $this->account_model->getSubTotalInMyCard($this->data_view['user_logged']['id']);
        
        if (!isset($this->data_view['data_user'])) {
            $this->data_view['data_user'] = NULL;
        }
        if (!isset($this->data_view['data_orders'])) {
            $this->data_view['data_orders'] = NULL;
        }
        if (!isset($this->data_view['data_card'])) {
            $this->data_view['data_card'] = NULL;
            $this->data_view['data_itemLength'] = 0;
        }else{
            $this->data_view['data_itemLength'] = count($this->data_view['data_card']);
        }
        $this->data_view['data_countries'] =$this->account_model->countries;
        if (!isset($page)) {
            $this->data_view['page'] = htmlspecialchars(json_encode(NULL));
        }else{
            $this->data_view['page'] = htmlspecialchars(json_encode($page));
        }
        $this->data_view['title']='A minha conta- HEALTHYDiet';
        $this->loadTemplate('account/account', $this->data_view);
    }

    public function createAccount() {
        if ($this->input->post('typeAddress') != 1) {
            $this->form_validation->set_rules(array_merge($this->account_model->config, $this->account_model->config_aux));
        } else {
            $this->form_validation->set_rules($this->account_model->config);
        }

        if ($this->form_validation->run() == FALSE) {
            $this->data_view['title']='Criar nova conta de cliente - HEALTHYDiet';
            $this->loadTemplate('account/register', false);
        } else {
            $User = new User_model();
            $User->type = $this->input->post('type');
            if ($User->type==2) {
                $User->nameCompany=$this->input->post('nameCompany');
            }else{
                unset($User->nameCompany);
                $User->type = 1;
            }
            $User->fname = $this->input->post('fname');
            $User->lname = $this->input->post('lname');
            $User->email = $this->input->post('email');
            $User->password = $this->input->post('password');
            $User->nif = $this->input->post('nif');
            $User->mobile = $this->input->post('mobile');
            $User->phone = $this->input->post('phone');
            $id_user = $this->account_model->create($User);
            $Address = new Address_model();
            $Address->id_user = $id_user;
            $Address->address = $this->input->post('faddress');
            $Address->zipNumber = $this->input->post('fzipNumber');
            $Address->city = $this->input->post('fcity');
            $Address->zipName = $this->input->post('fzipName');
            $Address->country = $this->input->post('fcountry');
            $id_faddress = $this->account_model->create($Address, "address");
            if ($this->input->post('typeAddress') != 1) {
                $Address = new Address_model();
                $Address->id_user = $id_user;
                $Address->address = $this->input->post('eaddress');
                $Address->zipNumber = $this->input->post('ezipNumber');
                $Address->city = $this->input->post('ecity');
                $Address->zipName = $this->input->post('ezipName');
                $Address->country = $this->input->post('ecountry');
                $Address->type = "E";
                $id_eaddress = $this->account_model->create($Address, "address");
            }
            if ($this->input->post('newsletter') == 1) {
                $newsletter['email']=$this->input->post('email');
                $newsletter['isActive']=$this->input->post('newsletter');
                $this->account_model->create($newsletter, "newsletter");
            }
            $subject = 'Registo na loja online Healthy Diet';
            $this->sendEmail($id_user, ucfirst($User->fname), ucfirst($User->lname), $User->email, $User->token, 'register',$subject, 'clientes@healthydiet.pt');
            $this->data_view['titleInfo']="Registo concluido com sucesso";
            $this->data_view['info']="A sua conta foi criada. <br> Para poder concluir o seu registo terá que ativar a sua conta, acedendo ao email que lhe foi enviado para a sua caixa de correio elecrónico e efectuando os passos explicados no mesmo.";
        }
        $this->data_view['title']='A minha conta - HEALTHYDiet';
        $this->data_view['products'] =$this->account_model->topSellingProducts();
        $this->loadTemplate('index', $this->data_view);
    }




    public function updateAccount() {

        $this->form_validation->set_rules($this->account_model->config_update_my_account);
        if ($this->form_validation->run() == TRUE) {
            $condition['id'] = $this->data_view['user_logged']['id'];
            $user['fname'] = $this->input->post('fname');
            $user['lname'] = $this->input->post('lname');
            $user['email'] = $this->input->post('email');
            $user['password'] = $this->input->post('password');
            $user['nif'] = $this->input->post('nif');
            $user['mobile'] = $this->input->post('mobile');
            $user['phone'] = $this->input->post('phone');
            $this->account_model->change($user, $condition);
            unset($condition);
            $condition = array('id_user' => $this->data_view['user_logged']['id'], 'type' => 'F');
            $address['address'] = $this->input->post('faddress');
            $address['zipNumber'] = $this->input->post('fzipNumber');
            $address['city'] = $this->input->post('fcity');
            $address['zipName'] = $this->input->post('fzipName');
            $address['country'] = $this->input->post('fcountry');
            $this->account_model->change($address, $condition, "address");
            unset($condition);
            if ($this->input->post('typeAddress') != 1) {
                unset($address);
                $condition = array('id_user' => $this->data_view['user_logged']['id'], 'type' => 'E');
                    $address['address'] = $this->input->post('eaddress');
                    $address['zipNumber'] = $this->input->post('ezipNumber');
                    $address['city'] = $this->input->post('ecity');
                    $address['zipName'] = $this->input->post('ezipName');
                    $address['country'] = $this->input->post('ecountry');
                $this->account_model->change($address, $condition, "address");
            }
            $newsletter['isActive']=$this->input->post('newsletter');
            $condition['email'] = $this->input->post('email');
            $this->account_model->change($newsletter, $condition, "newsletter");
        }
        $User = $this->session->userdata('user_logged');
        $User['email']=$this->input->post('email');
        $User['lname']=$this->input->post('lname');
        $User['fname']=$this->input->post('fname');
        $this->session->set_userdata('user_logged', $User);
        redirect(base_url() . 'account', 'refresh');
    }
    public function subscriveNewsletter(){
        if ($this->input->post('terms')==TRUE) {
            $condition['email']=$this->input->post('email');
            $result = $this->account_model->find($condition, "newsletter")->num_rows();
            if ($result == 0){
                $newsletter['email']=$this->input->post('email');
                $newsletter['isActive']=TRUE;   
                $this->account_model->create($newsletter, "newsletter");
                $subject="Subscrição da newsletter Healthy Diet.";
                $this->sendEmail('', '', '', $condition['email'], '', 'newsletter', $subject, 'geral@healthydiet.pt');
                echo json_encode("A subscrição da newsletter Healthy Diet foi concluída com sucesso.");
            }else{
                $condition['isActive']=FALSE;
                $result = $this->account_model->find($condition, "newsletter")->num_rows();
                if ($result == 0){
                    echo json_encode("O seu email já se encontra ativo.");
                }else{
                    $newsletter['isActive']=TRUE;
                    $condition['email'] = $this->input->post('email');
                    $this->account_model->change($newsletter, $condition, "newsletter");
                    $subject="Subscrição da newsletter Healthy Diet.";
                    $this->sendEmail('', '', '', $condition['email'], '', 'newsletter', $subject, 'geral@healthydiet.pt');
                    echo json_encode("A subscrição da newsletter Healthy Diet foi concluída com sucesso.");
                }
            }
        }else{
            echo json_encode("Precisa de aceitar os termos e condiçoes.");
        }
    }
     public function unsubscriveNewsletter($email){
        $newsletter['isActive']=FALSE;
        $condition['email'] = base64_decode($email);
        $this->account_model->change($newsletter, $condition, "newsletter");   
        $data_view['titleInfo']="Subscrição Anulada";
        $data_view['info']="A subscrição da newsletter Healthy Diet foi cancelada com sucesso.";
        $this->session->set_flashdata('data_view', $data_view); 
        redirect('home', 'refresh');    
    }
    public function verifyEmail() {
        $email = $this->input->post('email');
        if ($this->data_view['user_logged'] != false && $this->data_view['user_logged']['id'] >= 0) {
            $condition = array('email' => $email, 'id !=' => $this->data_view['user_logged']['id']);
        } else {
            $condition['email'] = $email;
        }
        $result = $this->account_model->find($condition)->num_rows();
        if ($result == 0)
            echo 'true';
        else
            echo 'false';
    }

    public function activeAccount($id, $token) {
        $condition = array('id' => $id, 'token' => $token);
        $result = $this->account_model->find($condition)->row();
        if ($result) {
            $set['status'] = 1;
            $this->account_model->change($set, $condition);
        }
        redirect('home', 'refresh');
    }

    public function updateCard(){
        $this->auth_model->isLoggedIn();
        $condition = array('id_user' => $this->data_view['user_logged']['id']);
        $result_query = $this->account_model->find($condition, 'card');
        if ($result_query->num_rows() > 0) {
            foreach ($result_query->result() as $row) {
                if ($this->input->post('quantity'.$this->data_view['user_logged']['id']."_".$row->idProduct)>0) {
                    $set['quantity'] = $this->input->post('quantity'.$this->data_view['user_logged']['id']."_".$row->idProduct);
                    $condition = array('id_user' => $this->data_view['user_logged']['id'],  'idProduct' => $row->idProduct);
                    $this->account_model->change($set, $condition, 'card');
                }else{
                    $condition = array('id_user' => $this->data_view['user_logged']['id'],  'idProduct' => $row->idProduct);
                    $this->account_model->drop($condition, 'card');
                }
            }
        }
        redirect('account/cart', 'refresh');
    }
    public function requestNewPassword(){
        $condition['email'] = $this->input->post('email');
        $row=$this->account_model->find($condition)->row();
        if($row){
            $subject = 'Pedido de Alteração de Password';
            $token = $this->account_model->createToken($condition['email']);
            $min = rand ( 0, 35 );
            $cod = substr($token, $min, 4); 
            if (strlen($min)==1) {
                $min='0'.$min;
            }
            $cod=$cod.$min;
            $this->sendEmail('', '', '', $condition['email'], $cod, 'recoverPassword', $subject, 'clientes@healthydiet.pt');
            $set = array('token' => $token, 'status' => 2);
            $this->account_model->change($set, $condition);
            $data['message']="Pedido de Alteração de Password efectuado com sucesso!";
            $data['error']=false;
            echo json_encode($data);
        }else{
            $data['message']="Não existe utilizador registado com este email!";
            $data['error']=true;
            echo json_encode($data);
        }   
    }
    public function recoverPassword(){
        $this->data_view['title']='Esqueceu-Se Da Sua Palavra-Passe? - HEALTHYDiet';
        $this->loadTemplate('account/recoverPassword', $this->data_view);
    }
    public function newPassword(){
        $email=$this->input->post('email');
        $password=$this->input->post('password');
        $confirmPassword=$this->input->post('confirmPassword');
        $cod=$this->input->post('cod');

        $condition['email'] = $email;
        
        $row=$this->account_model->find($condition)->row();
        if($row){
            if($confirmPassword==$password){
                $token = $row->token;
                $min=substr($cod, -2);
                $cod=substr($cod, 0, -2);
                $codFromToken=substr($row->token, $min, 4);
                if ($cod==$codFromToken) {
                    $newToken=$this->account_model->createToken($email);
                    $condition = array('token' => $token, 'email' => $email);
                    $set = array('token' => $newToken, 'status' => 1, 'password' => sha1($password));
                    $this->account_model->change($set, $condition);
                    $data['error']=false;
                    $data['message']='Password alterada com sucesso!';
                    echo json_encode($data);
                }else{
                    $data['cod']=$cod;
                    $data['min']=$min;
                    $data['token']=$token;
                    $data['codFromToken']=$codFromToken;
                    $data['error']=true;
                    $data['message']="O código inválido!";
                    echo json_encode($data);
                }
            }else{
                $data['error']=true;
                $data['message']="As duas passwords introduzidas têm de ser iguais!";
                echo json_encode($data);
            }
        }else{
            $data['error']=true;
            $data['message']="Não existe utilizador registado com este email!";
            echo json_encode($data);
        }
        
    }

    public function checkout() {
        $this->auth_model->isLoggedIn();
        $this->data_view['data_user'] = $this->account_model->getDataUser($this->data_view['user_logged']['id']);
        
        $myCard=$this->account_model->getMyCard($this->data_view['user_logged']['id']);
        $totalCard=$this->account_model->getTotalCard($this->data_view['user_logged']['id']);

        if (!isset($this->data_view['data_user'])) {
            $this->data_view['data_user'] = NULL;
        }
        if (!isset($myCard) or $myCard==NULL) {
            redirect(base_url().'account/cart' , 'refresh');
            exit();
        }
        $this->data_view['data_total_card'] = htmlspecialchars(json_encode($totalCard));
        $this->data_view['data_card'] = htmlspecialchars(json_encode($myCard));
        
        $zone = "international";
        if(!is_null($this->data_view['data_user']['eaddress'])){
            if ($this->data_view['data_user']['eaddress']->country == "Portugal") {
                $postal_code= substr($this->data_view['data_user']['eaddress']->zipNumber, 0, 5);
                if( is_numeric( $postal_code ) and $postal_code<9000) 
                    $zone = "portugal";
                else
                    $zone = "acoresMadeira";
            }
        }else{
            if ($this->data_view['data_user']['faddress']->country == "Portugal") {
                $postal_code= substr($this->data_view['data_user']['faddress']->zipNumber, 0, 5);
                if( is_numeric( $postal_code ) and $postal_code<9000) 
                    $zone = "portugal";
                else
                    $zone = "acoresMadeira";
            }
        }
        $this->data_view['data_transport'] = 0;

        if (($totalCard->total-$totalCard->totalDiscount) <= FREE_TRANSPORT) {
            $this->data_view['data_transport'] = $this->account_model->calculateTransport($this->data_view['user_logged']['id'], $zone);
        }

        $this->data_view['title']='Concluir a minha compra - HEALTHYDiet';
        $this->loadTemplate('account/checkout', $this->data_view);
    }

    public function createOrder(){
        $this->auth_model->isLoggedIn();
        $data['data_user'] = $this->account_model->getDataUserToCheckout($this->data_view['user_logged']['id']);
        $data['data_card'] = $this->account_model->getMyCard($this->data_view['user_logged']['id']);
        if (!isset($data['data_card'])) {
            return ;
        }
        $order=new stdClass();
        $order_address = new stdClass();
        $order->date=date("Y-m-d H:i:s");
        $order_address->delivery_address=$data['data_user']['eaddress']; 
        $order_address->billing_address=$data['data_user']['faddress'];
        $order->nif=$data['data_user']['user']->nif;
        $order->nameCompany=$data['data_user']['user']->nameCompany;
        $order->fname=$data['data_user']['user']->fname;
        $order->lname=$data['data_user']['user']->lname;
        $order->email=$data['data_user']['user']->email;
        $order->id_user=$data['data_user']['user']->id;
        $order->more_info=$this->input->post('more_info');
        $order->type_payment=$this->input->post('type_payment');
        $zone = "international";
        if(!is_null($data['data_user']['eaddress'])){
            if ($data['data_user']['eaddress']->country == "Portugal") {
                $postal_code= substr($data['data_user']['eaddress']->zipNumber, 0, 5);
                if( is_numeric( $postal_code ) and $postal_code<9000) 
                    $zone = "portugal";
                else
                    $zone = "acoresMadeira";
            }
        }else{
            if ($data['data_user']['faddress']->country == "Portugal") {
                $postal_code= substr($data['data_user']['faddress']->zipNumber, 0, 5);
                if( is_numeric( $postal_code ) and $postal_code<9000) 
                    $zone = "portugal";
                else
                    $zone = "acoresMadeira";
            }
        }
        $order->transport = 0;
        $totalCard = $this->account_model->getTotalCard($this->data_view['user_logged']['id']);
        $order->amount = ($totalCard->total - $totalCard->totalDiscount);
        if (($totalCard->total-$totalCard->totalDiscount) <= FREE_TRANSPORT) {
            $order->transport = $this->account_model->calculateTransport($this->data_view['user_logged']['id'], $zone);
        }
        //unset($data['data_user']['faddress']->id_user);
        $order->delivery_address=$this->account_model->create($order_address->delivery_address, "orders_address");
        $order->billing_address=$this->account_model->create($order_address->billing_address, "orders_address");
        $order->id=$this->account_model->create($order, "orders");
        if ($data['data_user']['user']->type==2) {
            $order->name=$data['data_user']['user']->nameCompany;
        }else{
            $order->name=$data['data_user']['user']->fname." ".$data['data_user']['user']->lname;
        }
        $data['data_order']['order']=$order;
        for ($i=0; $i <count($data['data_card']) ; $i++) { 
            $data['data_card'][$i]->id_order= $order->id;            
            $card=$this->account_model->create($data['data_card'][$i], "orders_products");
            $data['data_card'][$i]->id = $card;
        }

        $condition['id_user']=$this->data_view['user_logged']['id'];
        $this->account_model->drop($condition, 'card');
        if ($order->type_payment==1) {
            $data['data_order']['reference']=$this->generateRef( $order->id, $order->amount);
        }

        //calulate transport




        //calulate transport


        $this->sendEmail('', '', '', $order->email, '', 'recibo', 'Recibo loja HealthyDiet','orders@healthydiet.pt' ,$data);
        $this->sendEmail('', '', '', 'geral@healthydiet.pt', '', 'recibo_admin', 'Pedido de encomenda loja online','orders@healthydiet.pt',$data);
        $data_view['titleInfo']="Pedido de encomenda efectudado com sucesso";
        $data_view['info']='Caro(a) cliente, <br><br> Obrigado pela sua encomenda. <br><br> Em breve irá receber instruções no seu email para concluir a sua encomenda.';
        $this->session->set_flashdata('data_view', $data_view); 
        redirect(base_url() , 'refresh');
    }
    public function receipt($id){
        $this->auth_model->isLoggedIn();
        $condition = array('id_user' => $this->data_view['user_logged']['id'], 'id' => $id, 'status' => 0);
        $row = $this->account_model->find($condition, 'orders')->row();
        if($row){
            $html = $this->load->view('receipt/recibo_'.$id.'.html','',TRUE);
           // $html = $this->load->view('receipt/recibo_1.html','',TRUE);
             //PDF filename that user will get to download
            $pdfFilePath = "output_pdf_name.pdf";
            //load mPDF library
            $this->load->library('m_pdf');
           //generate the PDF from html
            $this->m_pdf->pdf->SetDisplayMode('fullpage');
            $this->m_pdf->pdf->WriteHTML($html,0);
            //download PDF
            $file = 'public/invoice/factura_'.$id.'.pdf';

            $this->m_pdf->pdf->Output($pdfFilePath, "D"); 
        }else{
            redirect(base_url() , 'refresh');
        }
    }
    public function invoice($id) {
        $this->auth_model->isLoggedIn();
        $condition = array('id_user' => $this->data_view['user_logged']['id'], 'id' => $id, 'status' => 1);
        $row = $this->account_model->find($condition, 'orders')->row();

        $file = '/public/invoice/factura_'.$id.'.pdf';
        //load the view and saved it into $html variable
        
        $html=$this->load->view('receipt/recibo_1.html','',TRUE);
 
       

        if($row){
            $filename = 'factura_'.$id.'.pdf';
            header('Content-type: application/pdf');
            header('Content-Disposition: inline; filename="' . $filename . '"');
            header('Content-Transfer-Encoding: binary');
            header('Accept-Ranges: bytes');
            readfile(base_url() . $file);

        }else{
            redirect(base_url() , 'refresh');
        }
    }

    public function addToCard(){
        $condition = array('id_user' => $this->data_view['user_logged']['id'], 'idProduct' => $this->input->post('idProduct'));
        $row = $this->account_model->find($condition, 'card')->row();
        if($row){
            $set['quantity'] = $this->input->post('quantity');
            $condition = array('id_user' => $this->data_view['user_logged']['id'],  'idProduct' => $row->idProduct);
            $this->account_model->change($set, $condition, 'card');
        }else{
            $item['quantity'] = $this->input->post('quantity');
            $item['id_user']=$this->data_view['user_logged']['id'];
            $item['idProduct']=$this->input->post('idProduct');
            $id_eaddress = $this->account_model->create($item, 'card');
        }
        echo json_encode($this->getTotalPriceCard());
        //echo 'produto adicionado com sucesso';
    }

 

function generateRef($order_id, $order_value) {
    define('URL', 'https://services.lusopay.com/PaymentServices/PaymentServices.svc?wsdl'); 
    define('NIF', '229926720'); 
    define('GUID', 'ab0410c0-49ba-4bef-97b2-9f6415ae2fef'); 
    $client = new SoapClient(URL);

    //Data, connection, auth

    //URL de Testes
    //$soapUrl = "https://services.lusopay.com/PaymentServices/PaymentServices.svc?wsdl";

    //URL Produtivo
    //$soapUrl = "https://services.lusopay.com/PaymentServices/PaymentServices.svc?wsdl";

        $xml_post_string='<?xml version="1.0" encoding="utf-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:pay="http://schemas.datacontract.org/2004/07/PaymentServices">
   <soapenv:Body>
      <tem:getNewDynamicReference>
         <!--Optional:-->
         <tem:clientGuid>'.GUID.'</tem:clientGuid>
         <!--Optional:-->
         <tem:vatNumber>'.NIF.'</tem:vatNumber>
         <!--Optional:-->
         <tem:valueList>
            <!--Zero or more repetitions:-->
            <pay:References>
               <!--Optional:-->
               <pay:amount>'.$order_value.'</pay:amount>
               <!--Optional:-->
               <pay:description>'.$order_id.'</pay:description>
               <!--Optional:-->
               <pay:serviceType>Both</pay:serviceType>
            </pay:References>
         </tem:valueList>
         <!--Optional:-->
         <tem:sendEmail>false</tem:sendEmail>
      </tem:getNewDynamicReference>
   </soapenv:Body>
</soapenv:Envelope>';


$headers = array(
                    "Host: services.lusopay.com",
                    "Content-type: text/xml;charset=\"utf-8\"",
                    "Accept: text/xml",
                    "Cache-Control: no-cache",
                    "Pragma: no-cache",
                    "SOAPAction: http://tempuri.org/IPaymentServices/getNewDynamicReference",
                    "Content-length: ".strlen($xml_post_string),
                );

//SOAPAction: your op URL
$url = URL;
// PHP cURL for http connection with auth
$ch = curl_init();

    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
      curl_setopt($ch, CURLOPT_URL, $url);

      curl_setopt($ch, CURLOPT_POST, 1);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $xml_post_string);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    $response = curl_exec($ch);

        curl_close($ch);


        $entidade = "/<a:entityMB>(.*?)<\/a:entityMB>/s";
        $referenceMB = "/<a:referenceMB>(.*?)<\/a:referenceMB>/s";
        $referencePS = "/<a:referencePS>(.*?)<\/a:referencePS>/s";

    if (preg_match($referencePS, $response, $referencePS_value) && preg_match($referenceMB, $response, $referenceMB_value) && preg_match($entidade, $response, $entidade_value)) {

        $refs[1] = $referenceMB_value[1];

        $refs[2] = $referencePS_value[1];

        $refs[3] = $entidade_value[1];



        //return $refs;

    } else {

        $message = "/<a:message>(.*?)<\/a:message>/s";

        if (preg_match($message, $response, $message_value)) {

            return $message_value[1];

        }

    }


    if($refs[1] != -1){
        $refs[1] = substr($refs[1],0,3).' '.substr($refs[1],3,3).' '.substr($refs[1],6,3);
        $value=new stdClass();
        $value->entity=$refs[3];
        $value->reference=$refs[1];
        $value->amount=$order_value;
    }
    return $value;

    }
}