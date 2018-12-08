<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'models/App_model.php';

class Product_model extends App_model {

    public function __construct() {
        parent::__construct();

        $this->tableName = "products";
    }
    /*public function getProducts() {
        $query='p.name, p.id as id, p.price, IFNULL(GROUP_CONCAT(p_g.id_gender),"") as gender,
        IFNULL(GROUP_CONCAT(p_a.id_age),"") as age, IFNULL(GROUP_CONCAT(p_p.id_brands),"") as Brand, IFNULL(GROUP_CONCAT(p_c.idCategory),"") as category';
        $this->db->select($query)
        ->from('products p')
        ->join('product_category p_c', 'p_c.idProduct= p.id', 'left')
        ->join('product_age p_a', 'p_a.idProduct= p.id', 'left')
        ->join('product_brands p_p', 'p_p.idProduct= p.id', 'left')
        ->join('product_gender p_g', 'p_g.idProduct= p.id', 'left')
        ->group_by('p.id')
        ->order_by('p.id', 'ASC');
        return $this->db->get();
    }*/
    public function paginate($limit, $number_products) {
        $number_pages = ceil($number_products / $limit);
        if ($number_pages==1) {

            return 0;
        }
        return $number_pages;
    }
    public function getListChecked($table, $list){
        $array= array();
        if ($list !=NULL && $list !='') {
            $result_query = $this->all($table);
            if ($result_query->num_rows() > 0) {
                $i=0;
                foreach ($result_query->result() as $row) {
                    if (in_array($row->id, $list, true)) {
                        $array[$i] =$row->id;
                    }else{
                        $array[$i]='';
                    }
                    $i++;
                }
            }
        }
        return $array;
    }
    public function getProductsRelated($list_categories, $idProduct){
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
       if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $this->db->select('p.name, p.id as id, p.price as original_price, ROUND((p.price-(p.price*(p.'.$field.'/100))),2) as price')->from('products p');
        $this->db->join('products ', 'p.id != '.intval($idProduct));
        if ($list_categories!=NULL) {
            $this->db->join('product_category p_c', 'p.id = p_c.idProduct');

           // $this->db->where('p.id!='.intval($idProduct));
            foreach ($list_categories as $category) {
                $this->db->or_where('p_c.idCategory='.intval($category->idCategory));
            }
        }

        $this->db->group_by('p.id');
        return $this->db->limit(10)->get()->result();
    }
    public function getProducts($list_categories, $list_brands, $order, $keywords) {
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
        if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $columns = array('p.name'=> 2,'p.description'=> 0.2,'p.summary'=> 0.2,'brand.name'=> 0.01,'p.ingredients'=> 0.2,'p.productCod'=> 1.5,'p.keywords'=> 0.7,'p.others'=> 0.2);
        $query='p.name, p.id as id, p.keywords ,p.smallDescription,  ROUND((p.price-(p.price*(p.'.$field.'/100))),2) as price, p.price as original_price, '.$field.' as discount,';

        if ($keywords!=NULL) {

            $listKeywords = explode(" ", $keywords);
            $query .= '(';
            $i=0;

            foreach ($columns as $column => $keyColumn) {
                foreach ($listKeywords as $keyword) {
                    if ($i>0) {
                        $query .=' + ';
                    }
                    $query .= ''.$keyColumn.' * (instr ('.$column.',\''.$keyword.'\' )>=1) ';
                    $i++;
                }

            }
            $query .= ') as weights';
        }

        $this->db->select($query)->from('products p');
        if ($list_categories!=NULL) {
            $this->db->join('product_category p_c', 'p.id = p_c.idProduct');
            $this->db->where_in('p_c.idCategory ', $list_categories);
            /*foreach ($list_categories as $category) {
                $this->db->where('(select COUNT(*) as count from  product_category c where `id` = `c`.`idProduct` AND c.idCategory='.intval($category) .')> 0 ' , NULL, FALSE );
            }*/
        }

        $this->db->join('brands', 'p.idBrand = brands.id');

        if ($list_brands!=NULL) {
            $this->db->where_in('brands.id', $list_brands);
            /*$this->db->or_group_start();
            var_dump($list_brands);
            exit();
            foreach ($list_brands as $Brand) {
                $this->db->where('(select COUNT(*) as count from  product_brands where `id` = `product_brands`.`idProduct` AND product_brands.idBrand='.intval($Brand) .')= 0 ' , NULL, FALSE );
                //$this->db->where('p_p.idBrand ', intval($Brand));
            }
            $this->db->group_end();*/

        }

        $this->db->where('p.isActive', True);
        $this->db->group_by('p.id');
        switch ($order) {
        case 1:
            $this->db->order_by('p.name', 'ASC');
            break;
        case 2:
            $this->db->order_by('p.name', 'DESC');
            break;
        case 3:
            $this->db->order_by('price', 'DESC');
            break;
        case 4:
            $this->db->order_by('price', 'ASC');
            break;
        default:
            if ($keywords!=NULL) {
                $this->db->having('weights >0');
                $this->db->order_by('weights', 'DESC');
            }else{
                $this->db->order_by('p.id', 'ASC');
            }
        }
        return $this->db;
    }

}






