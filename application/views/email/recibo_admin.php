<?php 
date_default_timezone_set('Europe/Lisbon');
$total_discount = 0;
?>
<!DOCTYPE html>
<html >
<head>
    <style type="text/css">
        *{
            font-family: sans-serif;
        }
    </style>
</head>
    <body >
        <div style="width:960px;min-width:960px;margin:0 auto;">
                            <div style="display:block;float:left;width:100%;font-weight:100;font-size:20px;">
                                <div style="display:block;font-weight:100;font-size:20px;text-align:left;float:left;width:50%" >
                                    <div style="display:block;width:320px;margin-bottom:20px;font-weight:100;font-size:20px;">
                                        <img src="<?=base_url()?>public/img/logo2.png"  style="margin: 20px;width: 130px;height:auto;"/>
                                    </div>
                                    <div style="display:block;font-weight:100;text-align:left;float:left;width:40%;">
                                        <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0px;margin-top: 4px;">
                                            Rua de Santo António Nº100
                                        </p>
                                        <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0p;margin-top: 4px;x">
                                            2435-063 Caxarias - Ourém
                                        </p>
                                        <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0px;margin-top: 4px;">
                                            Portugal
                                        </p>
                                    </div>
                                    <div style="display:block;float:left;width:60%;font-weight:100;font-size:20px;text-align:left">
                                        <div style="display:block;width:100%;">
                                            <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0px;margin-top: 4px;">
                                                Tlf. 249 577 777
                                            </p>
                                            <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0px;margin-top: 4px;">
                                                Tlm. 914561361
                                            </p>
                                            <p style="font-family:sans-serif;font-size:11px;line-height:15px;font-weight:100;display:block;margin-bottom:0px;margin-top: 4px;">
                                                geral@healthydiet.pt
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div style="display:block;font-weight:100;font-size:20px;text-align:left;float:left;width:50%">
                                    <p style="width:45%;float:left;text-align: right;display: inline-block; margin: 0px;font-size: 13px;" >Data:</p>
                                    <p style="width:45%;text-align: left;float:left;display: inline-block;margin: 0px 0px 10px 10px;font-size: 13px;"><?php echo date("d-m-Y");  ?></p>
                                    <p style="float:left;width:45%;text-align: right;display: inline-block; margin: 0px;font-size: 13px;" >Nº de Utilizador:</p>
                                    <p style="float:left;width:50%;text-align: left;display: inline-block;margin: 0px 0px 10px 10px;font-size: 13px;"><?php echo $data_user['user']->id; ?></p>
                                    <p style="float:left;width:45%;text-align: right;display: inline-block; margin: 0px;font-size: 13px;" >Faturado a:</p>
                                    <p style="float:left;width:50%;text-align: left;display: inline-block;margin: 0px 0px 10px 10px;font-size: 13px;"><?php echo $data_order['order']->name; ?></p>
                                    <p style="float:left;width:45%;text-align: right;display: inline-block; margin: 0px;font-size: 13px;" >Nº de Contribuinte:</p>
                                    <p style="float:left;width:50%;text-align: left;display: inline-block;margin: 0px 0px 10px 10px;font-size: 13px;"><?php echo $data_user['user']->nif; ?></p>
                                    <p style="float:left;width:45%;text-align: right;display: inline-block; margin: 0px;font-size: 13px;" >Nº de Encomenda:</p>
                                    <p style="float:left;width:50%;text-align: left;display: inline-block;margin: 0px 0px 10px 10px;font-size: 13px;"><?php echo $data_order['order']->id; ?></p>
                                </div>
                            </div>
                           <div style="display:block;float:left;width:100%;font-weight:100;font-size:20px; margin-top:10px!important;">
                                <div style="display:block;text-align:left;float:left;width:40%;position:relative;background:#F8F7F6;padding: 3.5%;margin-bottom: 20px;margin-right: 3%;">
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        Morada de Entrega:
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo ucfirst($data_user['eaddress']->address); ?>
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo $data_user['eaddress']->zipNumber . " " .$data_user['eaddress']->zipName;?>
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo ucfirst($data_user['eaddress']->city); ?>
                                    </p>
                                </div>
                                <div style="display:block;width:40%;font-weight:100;font-size:20px;text-align:left;float:left;position:relative;background:#F8F7F6;padding: 3.5%; margin-bottom: 20px;margin-left: 3%" >
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        Morada de Faturação:
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo ucfirst($data_user['faddress']->address);  ?>
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo $data_user['faddress']->zipNumber . " " .$data_user['faddress']->zipName;  ?>
                                    </p>
                                    <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px">
                                        <?php echo ucfirst($data_user['faddress']->city); ?>
                                    </p>
                                </div>
                            </div>
                        <h2 style="display:block;float: left;width:960px;font-weight:100;font-size:20px;text-align:left">
                            Detalhes da Encomenda:
                        </h2>
                        <div style="display:block;position:relative;margin-bottom:20px;float:left; width:960px;">
                            <div style="display:block;width:100%;text-align:left;float: left;margin-top: 20px;background: #F8F7F6;font-size:13px">
                            <table style="width: 100%;border-collapse:collapse;border: 3px solid #000;">
                                    <thead>
                                        <tr>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Artigo
                                            </th>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Iva
                                            </th>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Desconto
                                            </th>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Preço
                                            </th>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Quantidade
                                            </th>
                                            <th style="border: 1px solid;padding: 0px 5px;text-align:center;">
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $total=0;
                                        foreach ($data_card as $product){ 
                                            ?>
                                            <tr>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php echo $product->name; ?>
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php echo $product->iva; ?>%
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php echo $product->discount; 
                                                    $total_discount += ($product->quantity*$product->price) * ($product->discount/100);
                                                    ?>% 
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php echo $product->price; ?>€
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php echo $product->quantity; ?>
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php 
                                                    $total+=$product->quantity*$product->price;
                                                    echo $product->quantity*$product->price; 
                                                    ?>€
                                                </td>
                                            </tr>
                                            <?php } ?>
                                            <tr>
                                                <td colspan="5" style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    Portes:
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php                                    
                                                    echo $data_order['order']->transport;
                                                    ?>€
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    Sub Total:
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php                                    
                                                    echo $total + $data_order['order']->transport;
                                                    ?>€
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    Descontos:
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php                                    
                                                    echo $total_discount;
                                                    ?>€
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    Total:
                                                </td>
                                                <td style="border: 1px solid;padding: 0px 5px;height: 30px;vertical-align: middle;">
                                                    <?php                                    
                                                    echo $total + $data_order['order']->transport - $total_discount;
                                                    ?>€
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                            </div>
                            <h2 style="display:block;float: left;width:960px;font-weight:100;font-size:20px;text-align:left">
                                Observações:
                            </h2>
                            <div style="display:block;font-weight:100;font-size:13px;text-align:left;float: left;margin-top: 20px;background: #F8F7F6;width:960px;">
                                <p style="font-family:sans-serif;line-height:15px;font-weight:100;font-size:13px;width: 56%;float: left;display: inline-block;padding: 0px 2%;">
                                    <?php echo ucfirst($data_order['order']->more_info); ?>
                                </p>
                                <div style="font-weight:100;width: 34%;float: left;display: inline-block;border-left: 1px solid #ddd;padding: 0px 2%;margin:13px 0px;font-weight:100;font-size:13px;text-align:left">
                                    <h4 style="margin-top: 0px;">Metodo de Pagamento:</h4>
                                    <div style="display:block;width:100%;">
                                        <?php 
                                        if ($data_order['order']->type_payment==1) {
                                            echo "Referência Multibanco";
                                        }else if ($data_order['order']->type_payment==2) {
                                            echo "Transferência Bancária";
                                        }else if ($data_order['order']->type_payment==3) {
                                            echo "Pagamento à cobrança";
                                        }
                                        ?>
                                    </div>
                                    <?php 
                                    if ($data_order['order']->type_payment==1) {
                                        ?>
                                        <div style="display:block;width:100%;">
                                            <div style="display:block;width:100%;">
                                                Entidade: <?php echo $data_order['reference']->entity; ?>
                                            </div>
                                            <div style="display:block;width:100%;">
                                                Referência: <?php echo $data_order['reference']->reference; ?>
                                            </div>
                                            <div style="display:block;width:100%;">
                                                Montante: <?php echo $data_order['reference']->amount; ?>€
                                            </div>
                                        </div>
                                        <?php 
                                    }else if ($data_order['order']->type_payment==2) {
                                        ?>
                                        <div style="display:block;width:100%;">
                                            NIB: 0010 0000 5361 5170 0010 4
                                        </div>
                                        <?php
                                    }else if ($data_order['order']->type_payment==3) {
                                        ?>
                                        <div style="display:block;width:100%;">
                                            O pagamento no acto da entrega tem custos adicionais para o cliente.
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                                
                            </div>
                            <div style="display:block;width:960px;font-weight:100;font-size:20px;text-align:right;float: left;border-top:1px solid #ddd;margin-top:10px;padding-top:30px;">
                                <p style="font-family:sans-serif;font-size:13px;font-weight:100;text-align:center">
                                    <strong style="font-family:sans-serif;font-weight:700">
                                        Tlf.
                                    </strong>
                                    249 790 976 |
                                    <strong style="font-family:sans-serif;font-weight:700">
                                        Tlm.
                                    </strong>
                                    918 748 068 |
                                    <strong style="font-family:sans-serif;font-weight:700">
                                        Tlm.
                                    </strong>
                                    912 981 019
                                </p>
                                <p style="font-family:sans-serif;font-size:13px;font-weight:100;text-align:center">
                                    <a href='http://www.healthydiet.pt' target="_blank"  style="text-decoration:none;color:#e82583">
                                        www.healthydiet.pt
                                    </a>
                                    |
                                    <a href='' style="text-decoration:none;color:#e82583">
                                        geral@healthydiet.pt
                                    </a>
                                    |
                                    <a href='http://www.facebook.com/dietistaodete/' style="text-decoration:none;color:#e82583">
                                        facebook.com/healthydiet
                                    </a>
                                </p>
                            </div>
                            <div style="text-align: center">
                                Este documento não serve de fatura
                            </div>
                        </div>
    </body>
</html>
