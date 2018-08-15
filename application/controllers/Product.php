<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . 'controllers/App.php';
class Product extends App{
    
    private $controller;
    private $model;
    public function __construct() {
        parent::__construct();

        $this->load->model('product_model');
        $this->load->model('user_logged_model');
        $this->product_model = $this->product_model;

        $this->load->library(array('session','common_helper'));
        $this->controller = strtolower(get_class($this));
        $this->data_view['user_logged']=FALSE;
        if ($this->session->userdata('user_logged')) {
            $this->data_view['user_logged']=$this->session->userdata('user_logged');
        }
    }

	public function index() {
        
        
        $result = $this->product_model->getProducts()->result();
        $this->data_view['products'] = htmlspecialchars(json_encode($result, JSON_NUMERIC_CHECK));
        $result = $this->product_model->all("gender")->result(); 
        $this->data_view['gender'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("age")->result(); 
        $this->data_view['age'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("categories")->result(); 
        $this->data_view['categories'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("pathologies")->result(); 
        $this->data_view['pathologies'] = htmlspecialchars(json_encode($result)); 
        $this->data_view['title']='Produtos - HEALTHYDiet';
        $this->loadTemplate('product/products', $this->data_view);
	}


	/**
	 * { apenas mostra a vista }
	 *
	 * @param      <type>  $idCategory  (description)
	 */
	public function productsByCategories() {
		
		$this->data_view['idCategory'] = $this->uri->segment(2, 0);
		$this->loadTemplate('product/products', $this->data_view);
	}
	
	public function product($id)
	{

        $keywords=$this->input->post('txtSearch');
        $condition["id"]=$id;
        $this->data_view['product'] = $this->product_model->find($condition)->row();
        $User = $this->session->userdata('user_logged');
        $discount=$this->data_view['product']->salePublic;
        if ($User !=null and $User['type']==2) {
            $discount=$this->data_view['product']->saleRetailer;
        }
        $this->data_view['title']=$this->data_view['product']->name.' - HEALTHYDiet';
        $this->data_view['description']=$this->data_view['product']->smallDescription;
        $this->data_view['keywords']=$this->data_view['product']->keywords;
        unset($condition["id"]);
        $this->data_view['product']->discount=$discount;
        $this->data_view['product']->original_price= $this->data_view['product']->price;
        $this->data_view['product']->price= round(($this->data_view['product']->price-($this->data_view['product']->price*($discount/100))),2);
        $this->data_view['product'] = htmlspecialchars(json_encode($this->data_view['product']));
        $condition["idProduct"]=$id;
        $list_categories = $this->product_model->find($condition, 'product_category')->result();
       
        $this->data_view['relatedProducts'] = htmlspecialchars(json_encode($this->product_model->getProductsRelated($list_categories, $id)));

		$this->loadTemplate('product/product', $this->data_view);
	}
    public function products()
    {

        $txtSearch=$this->input->post('txtSearch');
        $url = $this->uri->segment_array();
        $parameter =  array();
        $historic="products";
        for($i=2; $i<=$this->uri->total_segments(); $i++){
            $parameter[$url[$i]]=$url[++$i];
        }
        if (!isset($parameter['gender'])) {
            $parameter['gender']=0;
        }else{
            $historic.="/gender/".$parameter['gender'];
        }
        if (!isset($parameter['age'])) {
            $parameter['age']=0;
        }else{
            $historic.="/age/".$parameter['age'];
        }
        if (!isset($parameter['categories'])) {
            $parameter['categories']=NULL;
        }else{
            $historic.="/categories/".$parameter['categories'];
            $parameter['categories'] = explode("-", $parameter['categories']);
        }
        if (!isset($parameter['pathologies'])) {
            $parameter['pathologies']=NULL;
        }else{
            $historic.="/pathologies/".$parameter['pathologies'];
            $parameter['pathologies'] = explode("-", $parameter['pathologies']);
        }
        if (!isset($parameter['page'])) {
            $parameter['page']='1-15';
        }else{
            $historic.="/page/".$parameter['page'];
        }
        if (!isset($parameter['order'])) {
            $parameter['order']=0;
        }else{
            $historic.="/order/".$parameter['order'];
        }
        $parameter['page']=explode("-", $parameter['page']);
        if (!isset($parameter['keywords'])) {
            $parameter['keywords']=0;
        }else{
            $historic.="/keywords/".$parameter['keywords'];
        }
        if (!isset($txtSearch)) {
            $keywords=NULL;
            $this->data_view['title']='Produtos - HEALTHYDiet';
        }else{
            $historic.="/keywords/". $this->input->post('txtSearch');
            $keywords = $this->input->post('txtSearch');
            $this->data_view['title']='Resultados da procura para "'.$keywords.'" - HEALTHYDiet';
        }     
        $this->data_view['historic']=$historic;
        $this->data_view['keyword'] = htmlspecialchars(json_encode($keywords));
        $this->data_view['ageSelected'] = htmlspecialchars(json_encode($parameter['age']));
        $this->data_view['genderSelected'] =  htmlspecialchars(json_encode($parameter['gender']));
        $this->data_view['categoriesChecked'] = htmlspecialchars(json_encode($this->product_model->getListChecked('categories', $parameter['categories'])));

        $this->data_view['pathologiesChecked'] =  htmlspecialchars(json_encode($this->product_model->getListChecked('pathologies', $parameter['pathologies'])));

        $this->data_view['limit'] = htmlspecialchars(json_encode(intval($parameter['page'][1])));
        $this->data_view['currentPage'] = htmlspecialchars(json_encode(intval($parameter['page'][0])));
        $this->data_view['order'] = htmlspecialchars(json_encode(intval($parameter['order'])));
        $pathologies = str_replace("-", ", ", $parameter['pathologies']);
        $categories = str_replace("-", ", ", $parameter['categories']);
        $filtered_products = $this->product_model->getProducts($parameter['gender'], $parameter['age'], $categories, $pathologies, $parameter['order'], $keywords);
        $filtered_products_aux= clone $filtered_products;
        $numberProducts = $filtered_products_aux->get()->num_rows();
        $this->data_view['numberProducts'] = htmlspecialchars(json_encode($numberProducts));
        $result=$this->product_model->paginate(intval($parameter['page'][1]), $numberProducts);
        $this->data_view['numberPages'] = htmlspecialchars(json_encode($result));


        $result=$filtered_products->limit(intval($parameter['page'][1]),intval($parameter['page'][1])*(intval($parameter['page'][0])-1))->get()->result();

        //echo $this->db->last_query();
        $this->data_view['products'] = htmlspecialchars(json_encode($result, JSON_NUMERIC_CHECK));
        $result = $this->product_model->all("gender")->result(); 
        $this->data_view['gender'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("age")->result(); 
        $this->data_view['age'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("categories")->result(); 
        $this->data_view['categories'] = htmlspecialchars(json_encode($result));
        $result = $this->product_model->all("pathologies")->result(); 
        $this->data_view['pathologies'] = htmlspecialchars(json_encode($result));

        $this->loadTemplate('product/products', $this->data_view);
    }
	public function getProducts() {
        $gender=$this->input->post('gender');
        $age=$this->input->post('age');
        $categories=$this->input->post('categories');
        $pathologies=$this->input->post('pathologies');
        $order=$this->input->post('order');
        $page=$this->input->post('page');
        $limit=$this->input->post('limit');
        $keyword=$this->input->post('keyword');
        $historic="products";
        if ($gender!="" and $gender!=0) {
            $historic.="/gender/".$gender;
        }
        if ($age!="" and $age!=0) {
            $historic.="/age/".$age;
        }
        if ($categories!="") {
            $historic.="/categories/".$categories;
            $categories = explode("-", $categories);
        }
        if ($pathologies!="") {
            $historic.="/pathologies/".$pathologies;
            $pathologies = explode("-", $pathologies);
        }
        if ($order!="" and $order!=0) {
            $historic.="/order/".$order;
        }
        if ($page!="" and $limit!="" and $page!=1 and $limit!=15) {
            $historic.="/page/".$page."-".$limit;
        }
        if ($keyword!="") {
            $historic.="/keyword/".$keyword;
        }
        $result['historic']=$historic;
        $filtered_products = $this->product_model->getProducts($gender, $age, $categories, $pathologies, $order, $keyword);

        $filtered_products_aux= clone $filtered_products;
        $result['numberProducts'] = $filtered_products_aux->get()->num_rows(); 
        $result['products'] = $filtered_products->limit($limit,$limit*($page-1))->get()->result();

        $result['numberPages'] = $this->product_model->paginate($limit, $result['numberProducts']);
		echo json_encode($result);
	}
}
