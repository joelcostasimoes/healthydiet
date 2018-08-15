<?php 
class App_model extends CI_Model {

    public function __construct() {
        parent::__construct();

        $this->load->library('encrypt');
        $this->load->helper('date');
    }

/**
 * { function_description }
 *
 * @param      <type>  $table  (description)
 *
 * @return     <type>
 */
    public function all($table = null) {

        if(!is_null($table)) {
            $this->tableName = $table;
        }

        return $this->db->get($this->tableName);
    }

    public function find($condition, $table = null, $type = null) {

        if (isset($condition)) {

            if (!is_null($table)) {
                $this->tableName = $table;
            }

            if ($type == 'OR') {
                $this->db->or_where($condition);
                return $this->db->get($this->tableName);
            } else {
                $this->db->where($condition);
                return $this->db->get($this->tableName);
            } 

            return null;
        }

        return null;
    }

    public function drop($condition, $table = null) {

        if (!is_null($table)) {
            $this->tableName = $table;
        }

        if (isset($condition)) {
            $this->db->where($condition);
            return $this->db->delete($this->tableName);
        }

        return null; 
    }

    public function change($set, $where, $table = null) {

        if (!is_null($table)) {
            $this->tableName = $table;
        }

        if (isset($set) && isset($where)) {
            $this->db->where($where);
            return $this->db->update($this->tableName, $set);
        }

        return null; 
    }

    public function create($set, $table = null) {

        if (!is_null($table)) {
            $this->tableName = $table;
        }

        if (isset($set)) {
            if ($this->db->insert($this->tableName, $set)) {
                return $this->db->insert_id();
            }
        }

        return null;
    }

    public function getFilesArray($files) {

        $arrayOf = array();
        foreach ($files as $rawFile) {
            array_push($arrayOf, $this->getFileObject($rawFile->idmedia, $rawFile->src));
        }

        return $arrayOf;
    }

    public function getTableName() {
        return $this->tableName;
    }


    public function getPrimaryKeyName() {
        return 'id' . ucfirst($this->getTableName());
    }   
    public function createToken($value){
        return sha1($value . microtime() . rand());
    }
    public function topSellingProducts(){
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
       if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $this->db->select('p.id as id, ROUND((p.price-(p.price*(p.'.$field.'/100))),2) as price, p.name, SUM(oc.quantity)')->from('products p');
        $this->db->join('orders_products oc', 'p.id = oc.idProduct');
        $this->db->where('p.isActive', True);
        $this->db->order_by('SUM(oc.quantity) desc');
        $this->db->group_by('p.id');
        $result=$this->db->limit(3)->get()->result();
        return htmlspecialchars(json_encode($result, JSON_NUMERIC_CHECK));
    }

}
