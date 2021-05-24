<?php
    //load product list into the db
    session_start();
    if(!isset($_SESSION["username"]))
        exit();

    $db = "hm1";
    $conn = mysqli_connect("localhost","root","",$db) or die(mysqli_error($conn));

    $idCliente =  $_SESSION["user_id"];
    $codiceProdotto = $_GET["codice_prodotto"];
    $quantita = $_GET["quantita"];

    $query ="insert into lista values ($idCliente,$codiceProdotto,$quantita);";

    $res = mysqli_query($conn, $query) ;

    echo json_encode($res);

    $value = json_encode(null);
    setcookie("list",$value);

?>