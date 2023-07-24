<?php
include('mail.php');
$correo = urldecode($_REQUEST['correo']);
$subject = urldecode($_REQUEST['subject']);
$body = urldecode($_REQUEST['body']);
send_mail($correo, $subject, $body);
?>