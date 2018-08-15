<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'models/App_model.php';

class Account_model extends App_model {

    public function __construct() {
        parent::__construct();
        $this->tableName = "user";
        $this->countries = array(
               'Afeganistão',
               'África do Sul',
               'Albânia',
               'Alemanha',
               'Andorra',
               'Angola',
               'Anguilla',
               'Antártida',
               'Antígua e Barbuda',
               'Arábia Saudita',
               'Argélia',
               'Argentina',
               'Armênia',
               'Aruba',
               'Austrália',
               'Áustria',
               'Azerbaijão',
               'Bahamas',
               'Bahrein',
               'Bangladesh',
               'Barbados',
               'Bélgica',
               'Belize',
               'Benin',
               'Bermudas',
               'Bielorrússia',
               'Bolívia',
               'Bósnia e Herzegovina',
               'Botsuana',
               'Brasil',
               'Brunei',
               'Bulgária',
               'Burquina Faso',
               'Burundi',
               'Butão',
               'Cabo Verde',
               'Camboja',
               'Canadá',
               'Catar',
               'Cazaquistão',
               'Ceuta e Melilha',
               'Chade',
               'Chile',
               'China',
               'Chipre',
               'Cidade do Vaticano',
               'Cingapura',
               'Colômbia',
               'Comores',
               'Congo - Brazzaville',
               'Congo - Kinshasa',
               'Coreia do Norte',
               'Coreia do Sul',
               'Costa do Marfim',
               'Costa Rica',
               'Croácia',
               'Cuba',
               'Curaçao',
               'Diego Garcia',
               'Dinamarca',
               'Djibuti',
               'Dominica',
               'Egito',
               'El Salvador',
               'Emirados Árabes Unidos',
               'Equador',
               'Eritreia',
               'Eslováquia',
               'Eslovênia',
               'Espanha',
               'Estados Unidos',
               'Estônia',
               'Etiópia',
               'Fiji',
               'Filipinas',
               'Finlândia',
               'França',
               'Gabão',
               'Gâmbia',
               'Gana',
               'Geórgia',
               'Geórgia do Sul e Ilhas Sandwich do Sul',
               'Gibraltar',
               'Granada',
               'Grécia',
               'Groenlândia',
               'Guadalupe',
               'Guam',
               'Guatemala',
               'Guernsey',
               'Guiana',
               'Guiana Francesa',
               'Guiné',
               'Guiné Bissau',
               'Guiné Equatorial',
               'Haiti',
               'Holanda',
               'Honduras',
               'Hong Kong, RAE da China',
               'Hungria',
               'Iêmen',
               'Ilha Christmas',
               'Ilha de Ascensão',
               'Ilha de Man',
               'Ilha Norfolk',
               'Ilhas Åland',
               'Ilhas Caiman',
               'Ilhas Canárias',
               'Ilhas Cocos (Keeling)',
               'Ilhas Cook',
               'Ilhas Distantes dos EUA',
               'Ilhas Faroe',
               'Ilhas Malvinas',
               'Ilhas Marianas do Norte',
               'Ilhas Marshall',
               'Ilhas Pitcairn',
               'Ilhas Salomão',
               'Ilhas Turks e Caicos',
               'Ilhas Virgens Britânicas',
               'Ilhas Virgens dos EUA',
               'Índia',
               'Indonésia',
               'Irã',
               'Iraque',
               'Irlanda',
               'Islândia',
               'Israel',
               'Itália',
               'Jamaica',
               'Japão',
               'Jersey',
               'Jordânia',
               'Kosovo',
               'Kuwait',
               'Laos',
               'Lesoto',
               'Letônia',
               'Líbano',
               'Libéria',
               'Líbia',
               'Liechtenstein',
               'Lituânia',
               'Luxemburgo',
               'Macau, RAE da China',
               'Macedônia',
               'Madagascar',
               'Malásia',
               'Malawi',
               'Maldivas',
               'Mali',
               'Malta',
               'Marrocos',
               'Martinica',
               'Maurício',
               'Mauritânia',
               'Mayotte',
               'México',
               'Mianmar (Birmânia)',
               'Micronésia',
               'Moçambique',
               'Moldávia',
               'Mônaco',
               'Mongólia',
               'Montenegro',
               'Montserrat',
               'Namíbia',
               'Nauru',
               'Nepal',
               'Nicarágua',
               'Níger',
               'Nigéria',
               'Niue',
               'Noruega',
               'Nova Caledônia',
               'Nova Zelândia',
               'Omã',
               'Países Baixos Caribenhos',
               'Palau',
               'Panamá',
               'Papua-Nova Guiné',
               'Paquistão',
               'Paraguai',
               'Peru',
               'Polinésia Francesa',
               'Polônia',
               'Porto Rico',
               'Portugal',
               'Quênia',
               'Quirguistão',
               'Quiribati',
               'Reino Unido',
               'República Centro-Africana',
               'República Dominicana',
               'República dos Camarões',
               'República Tcheca',
               'Reunião',
               'Romênia',
               'Ruanda',
               'Rússia',
               'Saara Ocidental',
               'Saint Pierre e Miquelon',
               'Samoa',
               'Samoa Americana',
               'San Marino',
               'Santa Helena',
               'Santa Lúcia',
               'São Bartolomeu',
               'São Cristóvão e Nevis',
               'São Martinho',
               'São Tomé e Príncipe',
               'São Vicente e Granadinas',
               'Senegal',
               'Serra Leoa',
               'Sérvia',
               'Seychelles',
               'Sint Maarten',
               'Síria',
               'Somália',
               'Sri Lanka',
               'Suazilândia',
               'Sudão',
               'Sudão do Sul',
               'Suécia',
               'Suíça',
               'Suriname',
               'Svalbard e Jan Mayen',
               'Tailândia',
               'Taiwan',
               'Tajiquistão',
               'Tanzânia',
               'Território Britânico do Oceano Índico',
               'Territórios Franceses do Sul',
               'Territórios palestinos',
               'Timor-Leste',
               'Togo',
               'Tokelau',
               'Tonga',
               'Trinidad e Tobago',
               'Tristão da Cunha',
               'Tunísia',
               'Turcomenistão',
               'Turquia',
               'Tuvalu',
               'Ucrânia',
               'Uganda',
               'Uruguai',
               'Uzbequistão',
               'Vanuatu',
               'Venezuela',
               'Vietnã',
               'Wallis e Futuna',
               'Zâmbia',
               'Zimbábue',
            );
        $this->config = array(
            array(
                'field' => 'fname',
                'label' => 'Nome',
                'rules' => 'trim|required|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'lname',
                'label' => 'Apelido',
                'rules' => 'trim|required|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'email',
                'label' => 'Email',
                'rules' => 'trim|required|xss_clean|valid_email|max_length[80]|is_unique[user.email]'
            ),
            array(
                'field' => 'password',
                'label' => 'Password',
                'rules' => 'trim|required|xss_clean|max_length[150]|matches[cpassword]|sha1'
            ),
            array(
                'field' => 'cpassword',
                'label' => 'Confirmar Password',
                'rules' => 'trim|required|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'nif',
                'label' => 'Número de Identificação Fiscal',
                'rules' => 'trim|required|xss_clean|min_length[9]|max_length[9]|numeric'
            ),
            array(
                'field' => 'phone',
                'label' => 'Telefone',
                'rules' => 'trim|min_length[9]|max_length[11]|numeric'
            ),
            array(
                'field' => 'mobile',
                'label' => 'Telemóvel',
                'rules' => 'trim|min_length[9]|max_length[11]|numeric'
            ),
            array(
                'field' => 'faddress',
                'label' => 'Morada de Faturação',
                'rules' => 'trim|required|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'fzipNumber',
                'label' => 'Codigo de Postal',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'fzipName',
                'label' => 'Concelho',
                'rules' => 'trim|required|xss_clean|max_length[300]'
            ),
            array(
                'field' => 'fcity',
                'label' => 'Localidade',
                'rules' => 'trim|required|xss_clean|max_length[100]'
            ),
            array(
                'field' => 'terms',
                'label' => 'Termos e Condiçoes',
                'rules' => 'trim|required|xss_clean'
            )
        );
        $this->config_aux = array(
            array(
                'field' => 'eaddress',
                'label' => 'Morada de Entrega',
                'rules' => 'trim|required|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'ezipNumber',
                'label' => 'Codigo de Postal de Entrega',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'ezipName',
                'label' => 'Concelho Entrega',
                'rules' => 'trim|required|xss_clean|max_length[300]'
            ),
            array(
                'field' => 'ecity',
                'label' => 'Localidade de Entrega',
                'rules' => 'trim|required|xss_clean|max_length[100]'
            )
        );
        $this->config_update_my_account = array(
            array(
                'field' => 'fname',
                'label' => 'Nome',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'lname',
                'label' => 'Apelido',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'email',
                'label' => 'Email',
                'rules' => 'trim|xss_clean|valid_email|max_length[80]'
            ),
            array(
                'field' => 'password',
                'label' => 'Password',
                'rules' => 'trim|xss_clean|max_length[150]|matches[cpassword]|sha1'
            ),
            array(
                'field' => 'cpassword',
                'label' => 'Confirmar Password',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'nif',
                'label' => 'Número de Identificação Fiscal',
                'rules' => 'trim|xss_clean|min_length[9]|max_length[9]|numeric'
            ),
            array(
                'field' => 'phone',
                'label' => 'Telefone',
                'rules' => 'trim|min_length[9]|max_length[11]|numeric'
            ),
            array(
                'field' => 'mobile',
                'label' => 'Telemóvel',
                'rules' => 'trim|min_length[9]|max_length[11]|numeric'
            ),
            array(
                'field' => 'faddress',
                'label' => 'Morada de Faturação',
                'rules' => 'trim|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'fzipNumber',
                'label' => 'Codigo de Postal',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'fzipName',
                'label' => 'Concelho',
                'rules' => 'trim|xss_clean|max_length[100]'
            ),
            array(
                'field' => 'fcity',
                'label' => 'Localidade',
                'rules' => 'trim|xss_clean|max_length[100]'
            ),
            array(
                'field' => 'eaddress',
                'label' => 'Morada de Entrega',
                'rules' => 'trim|xss_clean|min_length[3]|max_length[300]'
            ),
            array(
                'field' => 'ezipNumber',
                'label' => 'Codigo de Postal de Entrega',
                'rules' => 'trim|xss_clean|max_length[150]'
            ),
            array(
                'field' => 'ezipName',
                'label' => 'Concelho Entrega',
                'rules' => 'trim|xss_clean|max_length[300]'
            ),
            array(
                'field' => 'ecity',
                'label' => 'Localidade de Entrega',
                'rules' => 'trim|xss_clean|max_length[100]' 
            )
        );
    }

    public function getDataUser($id) {
        $condition['id'] = $id;
        $data_user['user'] = $this->find($condition)->row();
        unset($condition);
        $condition = array('id_user' => $id, 'type' => 'F');
        $data_user['faddress'] = $this->find($condition, 'address')->row();
        $condition = array('id' => $id, 'type' => 'E');
        $data_user['eaddress'] = $this->find($condition, 'address')->row();
        unset($data_user['user']->password);
        unset($data_user['user']->status);
        unset($data_user['user']->token);
        unset($data_user['user']->id);
        unset($data_user['faddress']->id_user);
        unset($data_user['faddress']->id);
        unset($data_user['faddress']->type);
        if ($data_user['eaddress']) {
            $data_user['typeAddress'] = 0;
            unset($data_user['eaddress']->id_user);
            unset($data_user['eaddress']->id);
            unset($data_user['eaddress']->type);
        } else {
            $data_user['typeAddress'] = 1;
            $data_user['eaddress'] = null;
        }
        return $data_user;
    }
    public function getDataUserToCheckout($id) {
        $condition['id'] = $id;
        $data_user['user'] = $this->find($condition)->row();
        $condition = array('id_user' => $id, 'type' => 'F');
        $data_user['faddress'] = $this->find($condition, 'address')->row();
        $condition = array('id_user' => $id, 'type' => 'E');
        $data_user['eaddress'] = $this->find($condition, 'address')->row();
        unset($data_user['user']->password);
        unset($data_user['user']->status);
        unset($data_user['user']->token);
        unset($data_user['faddress']->id_user);
        unset($data_user['faddress']->id);
        unset($data_user['faddress']->type);
        if ($data_user['eaddress']) {
            $data_user['typeAddress'] = 0;
            unset($data_user['eaddress']->id_user);
            unset($data_user['eaddress']->id);
            unset($data_user['eaddress']->type);
        } else {
            $data_user['eaddress']= new stdClass();
            $data_user['eaddress']->address = $data_user['faddress']->address;
            $data_user['eaddress']->zipNumber = $data_user['faddress']->zipNumber;
            $data_user['eaddress']->zipName = $data_user['faddress']->zipName;
            $data_user['eaddress']->city = $data_user['faddress']->city;
            $data_user['eaddress']->country = $data_user['faddress']->country;
        }
        return $data_user;
    }

    public function getMyOrders($id, $status) {
        $result_query = $this->db->select('orders.id, orders.more_info, orders.cod_order, orders.date, round(sum(orders_products.price * orders_products.quantity),2) as sum_price')
                ->from('orders')
                ->where('orders.id_user', $id)
                ->where('orders.status', $status)
                ->where('orders.exist_pdf', 1)
                ->join('orders_products', 'orders_products.id_order = orders.id')
                ->group_by('orders.id')
                ->get();
        $orders = NULL;
        if ($result_query->num_rows() > 0) {
            $orders = array();
            foreach ($result_query->result() as $row) {
                $order['id'] = $row->id;
                $order['cod_order'] = $row->cod_order;
                $order['date'] = $row->date;
                $order['sum_price'] = $row->sum_price;
                array_push($orders, $order);
            }
        }
        return htmlspecialchars(json_encode($orders));
    }
    public function getMyCard($id) {
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
        if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $result_query = $this->db->select('card.idProduct, products.price as price, card.quantity, products.name, products.iva, '.$field.' as discount')
                ->from('card')
                ->where('card.id_user', $id)
                ->join('products', 'card.idProduct = products.id')
                ->get();


        return $result_query->result();
    }


    public function getTotalCard($id) {
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
        if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $result_query = $this->db->select('sum((ROUND((products.price-(products.price*('.$field.'/100))),2))*card.quantity) as total, sum(ROUND( (products.price * card.quantity) * ('.$field.'/100),2)) as totalDiscount')
                ->from('card')
                ->where('card.id_user', $id)
                ->join('products', 'card.idProduct = products.id')
                ->get()->row();
        return $result_query;
    }
    public function getSubTotalInMyCard($id) {
        $User = $this->session->userdata('user_logged');
        $field='salePublic';
        if ($User !=null and $User['type']==2) {
            $field='saleRetailer';
        }
        $result_query = $this->db->select(' ROUND((products.price-(products.price*('.$field.'/100))),2) as price, card.quantity')
                ->from('card')
                ->where('card.id_user', $id)
                ->join('products', 'card.idProduct = products.id')
                ->get();
        $sum['sub_total']=0;
        if ($result_query->num_rows() > 0) {
            
            foreach ($result_query->result() as $row) {
                $sum['sub_total'] += $row->price*$row->quantity;
            }
        }
        return htmlspecialchars(json_encode($sum['sub_total']));
    }

    public function calculateTransport($id, $zone) {
        $weight = $this->db->select(' SUM(products.weight * card.quantity) as tranport')
                ->from('card')
                ->where('card.id_user', $id)
                ->join('products', 'card.idProduct = products.id')
                ->get()
                ->row()
                ->tranport;
        $result_query = $this->db->select('transport.'.$zone . ' as value')
                ->from('transport')
                ->where('(transport.max >= ' . $weight . ' and transport.min = 0)')
                ->or_where('(transport.min < ' . $weight . ' and transport.max >= ' . $weight . ')')
                ->or_where('(transport.min < ' . $weight . ' and transport.max = 0)')
                ->get();

        if ($result_query->num_rows() > 0) {
            return $result_query->row()->value;
        }else{
            return 0;
        }
        
    }

}
