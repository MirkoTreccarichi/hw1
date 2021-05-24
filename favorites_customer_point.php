<?php

    //load and save preferences in a coockie
    if(empty($_GET)){
        if(!isset($_COOKIE["prefcities"])){
            $value = json_encode($_GET);
            setcookie("prefcities",$value);
            echo true;
            exit();
        }

        $coockie = $_COOKIE["prefcities"];
        echo $coockie;
        exit();
    }
       
    if(!isset($_GET["citta0"])){
        if(isset($_COOKIE["prefcities"])){
            $value = json_encode(null);
            setcookie("prefcities",$value);
            echo true;
            exit();
        }
    }
        
    $coockie = json_decode($_COOKIE["prefcities"]);
    $value = json_encode($_GET);
    setcookie("prefcities",$value);
    echo true;

?>