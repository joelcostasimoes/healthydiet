<?php
require_once APPPATH . 'models/App_model.php';
class Address_model extends App_model {
    var $id_user;
    var $address;
    var $zipNumber;
    var $city;
    var $zipName;
    var $country;
    var $type;

    public function __construct($id_user="", $address="", $zipNumber="", $zipSnumber="", $city="", $zipName="", $country="Portugal", $type="F") {
        $this->id_user=$id_user;
        $this->address=$address;
        $this->zipNumber=$zipNumber;
        $this->city=$city;
        $this->zipName=$zipName;
        $this->country=$country;
        $this->type=$type;
    }
}
