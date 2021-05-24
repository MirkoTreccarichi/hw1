<?php

    //search by name products in DB
    $db = "hm1";
    $conn = mysqli_connect("localhost","root","",$db);

    $input =  mysqli_escape_string($conn,$_GET['query']) ;
    $query = mysqli_real_escape_string($conn,$input);
            // Cerco se l'username esiste già o se appartiene a una delle 3 parole chiave indicate
    $query = "SELECT * FROM prodotto WHERE nome LIKE '$query%';";
    $result = mysqli_query($conn, $query);


    $prodotti =  mysqli_fetch_all($result);

    echo json_encode($prodotti);

    mysqli_close($conn);
?>

