<?php
function conectar(){
    /*$host="mysql";
    $user="root";
    $pass="root";
    $bd="clinicaComunitarias";*/
    $host="sql105.infinityfree.com";
    $user="if0_34501190";
    $pass="A9zD7OEZiYjdnx";
    $bd="if0_34501190_medicamentosuabc";

    $con = mysqli_connect($host, $user, $pass, $bd) or die("Unable to Connect to '$host'");
    return $con;
}
?>
