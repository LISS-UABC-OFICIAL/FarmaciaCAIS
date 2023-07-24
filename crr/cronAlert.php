<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

include('../conexion.php');
include('mail.php');
$con = conectar();
/*$select = "SELECT
		MD.activoprincipalMedicamento,
		CM.marca,
		CM.fechadecaducidadMedicamento,
		u.correo,
		u.nombreUsuario
	FROM clinicatienemedicamento CM
	INNER JOIN medicamentos MD
		ON MD.idMedicamento = CM.idMedicamento
	INNER JOIN usuarios u
		ON CM.idUsuario = u.idUsuario
	WHERE TRUE
		AND CM.fechadecaducidadMedicamento <= DATE_ADD(CURRENT_DATE(), INTERVAL 3 MONTH)
		AND u.recibe_alertas = 1";*/
$medicamentos = "";
	$caducados ="";

$select = "SELECT MD.activoprincipalMedicamento, MD.idMedicamento, CM.marca, CM.fechadecaducidadMedicamento, CM.loteMedicamento FROM clinicatienemedicamento CM INNER JOIN medicamentos MD
    ON MD.idMedicamento = CM.idMedicamento WHERE CM.fechadecaducidadMedicamento > CURDATE() AND CM.fechadecaducidadMedicamento <= DATE_ADD(CURDATE(), INTERVAL 3 MONTH)";

$query = mysqli_query($con, $select);

while ($row = mysqli_fetch_assoc($query)) {
    $medicamentos .= "Medicamento " . $row['activoprincipalMedicamento'] . " de la marca " . $row['marca'] . ", ID: " . $row['idMedicamento'].  " próximo a vencer en " . $row['fechadecaducidadMedicamento'] . " Lote " . $row['loteMedicamento'] . "<br>";
}





$selectCaducados = "SELECT MD.activoprincipalMedicamento, MD.idMedicamento, CM.marca, CM.fechadecaducidadMedicamento, CM.loteMedicamento FROM clinicatienemedicamento CM INNER JOIN medicamentos MD
    ON MD.idMedicamento = CM.idMedicamento WHERE fechadecaducidadMedicamento < CURDATE() AND fechadecaducidadMedicamento != CURDATE()";

$queryCaducados = mysqli_query($con, $selectCaducados);

while ($rowCaducado = mysqli_fetch_assoc($queryCaducados)) {
    $caducados .= "Medicamento " . $rowCaducado['activoprincipalMedicamento'] . " de la marca " . $rowCaducado['marca'] . ", ID: " . $rowCaducado['idMedicamento'] . ", caducado el " . $rowCaducado['fechadecaducidadMedicamento'] . " Lote " . $rowCaducado['loteMedicamento'] .  "<br>";
}



$body = "Los siguientes medicamentos estan proximos a caducar dentro de 3 meses:<br><br>".$medicamentos;
$body .= "<br>Los siguientes medicamentos han caducado:<br><br>" . $caducados;


$subject = 'ACTUALIZACION MEDICAMENTOS';
    $select2 = "select * from usuarios where recibe_alertas=1";
    $query2 = mysqli_query($con, $select2);
    while($row2 = mysqli_fetch_assoc($query2)){
        $correo = $row2['correo'];
        $url = 'http://medicamentosuabc.infinityfreeapp.com/crr/envioMailforCron.php?correo='.urlencode($correo).'&subject='.urlencode($subject).'&body='.urlencode($body);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_HEADER, 0); 
        $data = curl_exec($ch); 
        curl_close($ch); 
        //echo $data; 
    }
//send_mail($correo, $subject, $body);
?>
