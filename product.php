<?php
    //load product from db

    $db = "hm1";
    $conn = mysqli_connect("localhost","root","",$db);

    $query = "SELECT * FROM prodotto";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    $products = array();

    while( $row = mysqli_fetch_row($res)){
        array_push($products,$row);
    }

    $product = array();
    foreach ($products as $prod) {
        array_push($product,array('code' => $prod[0],'producer' => $prod[1],'price' =>  $prod[3],'name' =>  $prod[5] , 'src' => $prod[6]));
    }
    
    echo json_encode($product);
?>