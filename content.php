<?php
    //send the customer point information
    $db = "hm1";
    $conn = mysqli_connect("localhost","root","",$db);

    $query = "SELECT * FROM punto_vendita";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    $affiliatsRes = array();

    while( $row = mysqli_fetch_row($res)){
        array_push($affiliatsRes,$row);
    }

    $Affilitates = array();
    foreach ($affiliatsRes as $aff) {
        array_push($Affilitates,array('title' => $aff[2],'src' =>  $aff[4],'address' =>  $aff[1]));
    }
    
    echo json_encode($Affilitates);
?>