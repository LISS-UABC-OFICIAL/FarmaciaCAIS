<?php
	include('../conexion.php');
	$con=conectar();

	$idClinica=$_GET['idClinica'];
	$idUsuario=$_GET['idUsuario'];
	$idMedicamento=$_GET['idMedicamento'];
	
	$selectMed = "select * from medicamentos where idMedicamento='$idMedicamento'"; 
	$queryMed = mysqli_query($con, $selectMed);
	$rowMed = mysqli_fetch_assoc($queryMed);
	$Ingrediente = $rowMed['activoprincipalMedicamento'];
	$Controlado = $rowMed['controlMedicamento'];
	$dosis = $rowMed['dosis'];
	$ubicacion = $rowMed['ubicacion'];
	$notas = $rowMed['notas'];
	$presentacion = $rowMed['idPresentacion'];
	$via = $rowMed['idDosis'];
	
	$selectCli = "select * from clinicatienemedicamento where idMedicamento='$idMedicamento'"; 
	$queryCli = mysqli_query($con, $selectCli);
	$rowCli = mysqli_fetch_assoc($queryCli);
	$marca = $rowCli['marca'];
	$lote = $rowCli['loteMedicamento'];
	$unidades = $rowCli['cantidadMedicamento'];
	$caducidad = $rowCli['fechadecaducidadMedicamento'];
        date_default_timezone_set("America/Tijuana");

    $ultimaModificacion = date('d-m-Y') . " a las " . date("h:i:sa");

	$sql_hist = "INSERT INTO historial VALUES(
			DEFAULT,
		$idMedicamento,
		'$Ingrediente',
		'$marca',
		'$lote',
		'$Controlado',
		'$dosis',
		'$ubicacion',
		'$notas',
		'$presentacion',
		'$unidades',
		'$caducidad',
		'$via',
		'$idUsuario',
			CURRENT_TIMESTAMP(),
			(SELECT
			    CONCAT(
                    'Medicamento ',
                    m.activoprincipalMedicamento,
                    ' id(', m.idMedicamento, ') eliminado por ',
                    u.nombreUsuario, ' (', u.correo, ').<br><span style=\'font-size: 14px; color: red;\'>Última Modificación: ', '$ultimaModificacion', '</span>'
                ) AS MSG
				FROM
					usuarios u
					LEFT JOIN medicamentos m
						ON m.idMedicamento = $idMedicamento
				WHERE u.idUsuario = '$idUsuario'
			)
		)";


	mysqli_query($con, $sql_hist);

	$sql="DELETE FROM clinicatienemedicamento WHERE idMedicamento ='$idMedicamento'";
	$query=mysqli_query($con,$sql);
	$sqldos="DELETE FROM medicamentos  WHERE idMedicamento='$idMedicamento'";
	$querydos=mysqli_query($con,$sqldos);

	if($query){
		Header("Location: ../vistas/inicio.php?delete=successfully");
	}
?>
