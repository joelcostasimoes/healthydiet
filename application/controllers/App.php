<?php defined('BASEPATH') OR exit('No direct script access allowed');

class App extends CI_Controller {

    private $controllerName;
    private $typeTitle;
    public $data_view;
    public $countries;
    
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->library('common_helper');
        $this->load->library('user_agent');
        $this->load->helper(array('url', 'file'));
        $this->load->model('account_model');
        if ($this->session->userdata('user_logged')) {
            $User=$this->session->userdata('user_logged');
            $condition = array('email' => $User['email'], 'token' => $User['token']);
            $result=$this->account_model->find($condition)->row();
            if(!$result){
                $this->session->unset_userdata('user_logged');
            }
        }
        $this->data_view['user_logged']=FALSE;
        if ($this->session->userdata('user_logged')) {
            $this->data_view['user_logged']=$this->session->userdata('user_logged');
            
        }
        
        $this->data_view['error']=null;
        $this->data_view['title']='Loja online HEALTHYDiet';
        $this->data_view['description']='';
        $this->data_view['keywords']='';
        $this->data_view['info']=null;
        $this->data_view['historic']=$this->agent->referrer();
        $this->data_view['titleInfo']=null;  
        
    }

    public function index() {
        redirect('home');
    }

    public function loadTemplate($path, $data) {        
        if ($data!=null and $this->session->flashdata('data_view')!=null) {
            $data=array_merge($data, $this->session->flashdata('data_view'));
        }else if ($data==null) {
            $data=$this->session->flashdata('data_view');
        }
        $data['card_header'] = $this->getTotalPriceCard();
        $this->template->write_view('content', $path, $data, TRUE);
        $this->template->render();
        
    }
    public function getControllerName() {
        return $this->controllerName;
    }

    public function getTypeTitle() {
        return $this->typeTitle;
    }

    protected function setControllerName($name) {
        $this->controllerName = $name;
        return $this;
    }
    
    protected function setTypeTitle($name) {
        $this->typeTitle = $name;
        return $this;
    }

    public function setModel($model) {
        $this->model = $model;
    }

    protected function getDefaultData() {
        $data = array();
        $data['controller'] = strtolower(get_class($this));
        $data['folder'] = strtolower(get_class($this));
        $data['page'] = $this->uri->segment(3, 0);
        return $data;
    }
    public function getTotalPriceCard() {
        
        $id = $this->data_view['user_logged']['id'];
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
        if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $result_query = $this->db->select('card.idProduct, ROUND((products.price-(products.price*(products.'.$field.'/100))),2) as price, card.quantity, products.name')
                ->from('card')
                ->where('card.id_user', $id)
                ->join('products', 'card.idProduct = products.id')
                ->get();

        $card = array();
        $card['number_products'] = 0;
        $card['total_card'] = 0;
        if ($result_query->num_rows() > 0) {
            foreach ($result_query->result() as $row) {
                $card['total_card'] +=$row->price*$row->quantity;
                $card['number_products']++;
            }
        }
        return $card;
        
    }
    public function sendEmail($id, $fname, $lname, $email, $more, $link, $subject, $from, $data=null) {
        $this->email->from($from, 'Loja online HEALTHY Diet');
        $this->email->to($email);
        $this->email->set_mailtype("html");
        $this->email->subject($subject);
        if ($data!=null) {
            $email_ready_to_send=$this->load->view('email/'.$link,$data, true);
        }else{
            $email_to_send = read_file(base_url() . "email/".$link);
            $email_ready_to_send = str_replace(array("[id]", "[nome]", "[apelido]", "[more]", "[url]", "[email]"), array($id, $fname, $lname, $more, base_url(), base64_encode($email)), $email_to_send);
        }
        if ($link=='recibo_admin') {
            $myfile = fopen("application/views/receipt/recibo_".$data['data_order']['order']->id.".html", "w") or die("Unable to open file!");
            fwrite($myfile, $email_ready_to_send);
            fclose($myfile);
        }

        
        $this->email->message($email_ready_to_send);
        $this->email->send();
    }

    public function email($email) {
        $this->load->view('email/'.$email.'.html');
    }
}
