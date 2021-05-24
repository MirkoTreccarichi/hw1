<?php
    //load and save the product list in a coockie
    if(empty($_GET)){
        if(!isset($_COOKIE["list"])){
            $value = json_encode($_GET);
            setcookie("list",$value);
            echo true;
            exit();
        }

        $coockie = $_COOKIE["list"];
        echo $coockie;
        exit();
    }
       
    if(!isset($_GET["prodotto0"])){
        if(isset($_COOKIE["list"])){
            $value = json_encode(null);
            setcookie("list",$value);
            echo true;
            exit();
        }
    }
        
    $coockie = json_decode($_COOKIE["list"]);
    $value = json_encode($_GET);
    setcookie("list",$value);
    echo true;

?>