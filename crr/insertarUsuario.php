<?php
    include('../conexion.php');
    include('mail.php');
    $con = conectar();

    $nombreUsuario = $_POST['nombreUsuario'];
    $correo = $_POST['correo'];
    $cargo = $_POST['cargo'];
    $pass = substr(md5(strval(rand())), 0, 5);
    if (isset($_POST['alertas'])) {
        $alertas = 1;
    } else {
        $alertas = 0;
    }

    echo var_dump(1);
    $sql = "SELECT 1 AS UNO FROM usuarios WHERE correo = '$correo'";
    $query = mysqli_fetch_array(mysqli_query($con, $sql));
    if (isset($query['UNO'])) {
        Header("Location: ../vistas/mostrarUsuarios.php?err=" . urldecode("El correo ya se encuentra registrado para otro usuario."));
        exit();
    }
    echo var_dump(2);
    $sql = "INSERT INTO usuarios(nombreUsuario, correo, cargo, expiration_date, claveUsuario, recibe_alertas) VALUES('$nombreUsuario','$correo', '$cargo', CURRENT_DATE(), MD5('$pass'), $alertas)";
    $query = mysqli_query($con,$sql);

    echo var_dump(3);
    echo $sql;
    if($query){
        echo var_dump(4);
		$subject = 'Su usuario se ha registrado';
		$body = "Hola,<br><br>
		Has sido dado de alta en el sistema de medicamentos de la Facultad de Medicina y Psicologia.
        <br><br>
        Usuario: $correo <br>
        Contraseña provisional: $pass <br>
        Cargo:$cargo  <br>
        <br><br>
        Ingresa al sistema atraves del siguiente enlace: http://medicamentosuabc.infinityfreeapp.com/vistas/iniciarsesion.php <br>
        enlace<br>
        Saludos.";

		send_mail(
			$correo,
			$subject,
			$body
		);
        Header("Location: ../vistas/mostrarUsuarios.php?insert=successfully");
    }
?>
