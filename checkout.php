<?php
   
    include "auth.php";
    
    if(!checkAuth())
        header("Location: home.php")
?> 

<!DOCTYPE html>
<html>

<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet"><meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Smartket</title>
    <link rel="stylesheet" href="styles/checkout.css">
    <script src="scripts/scriptcheckout.js" defer="true"></script>
    
</head>

<body>
    <header>
        <nav>

            <div id="logo">
                <img id="logoimg" src="img/Smartket/SmartketGreen.png">
                <div id="comp">Smartket&Co</div>
            </div>


            <div class="link">
                <a href="home.php">home</a>
                <a class="login" href="logout.php">logout</a>
                
            </div>

            <div id="menu">
                <div></div>
                <div></div>
                <div></div>
            </div>

        </nav>

        

    </header>

    <article>

        
    <section class="poster">
    

        <h1>Pensaci oggi ritira domani !<a href="customer.php">Oppure torna indietro</a></h1>

        <?php

            $db = "hm1";
            $conn = mysqli_connect("localhost","root","",$db);

            $query = "SELECT * FROM lista";
            $result = mysqli_query($conn, $query);

            if(!$result){
                exit();
            }
            
            $products =  mysqli_fetch_all($result);
                        
            echo "<h3>La tua lista</h3>";
            echo '<ul class="lista">';
            foreach ($products as $prod) {
                $code = $prod[1];
                $number = $prod[2];

                $query = "SELECT * FROM prodotto where codice = '$code' ;";
                $result = mysqli_query($conn, $query);
                $info =  mysqli_fetch_assoc($result);
                echo "<li>";
               
                echo $info["nome"]." ".$info["produttore"]." X ".$number;
                echo "</li>";
            }



            mysqli_close($conn);
            
            echo "</ul>";
            echo "<hr>";

        ?>

        <div class="lists hidden">
            <h3>Le tue liste</h3>

            <div class="grid">

            </div>
        </div>


        <div class="choosen hidden">
            <h3>Le tue scelte</h3>
            <input type="button" value="Salva">
            <div class="grid">

            </div>
        </div>

        <div class="choices">
            <h3>Clicca sul carrello</h3>
            <span>Cerca i tuoi prodotti </span><input type="search">

                <div class="grid">

                </div>
        </div>

    </section>

     

    </article>


    <footer>
        <div id="logo">
            <img id="logoimg" src="img/Smartket/SmartketWhite.png" alt="">
            <div id="comp">Smartket&Co</div>
        </div>

        <div id="social">

            <img src="img/loghi/facebook.png">
            <img src="img/loghi/ig.png">
            <img src="img/loghi/whatsapp-128.png">
            <img src="img/loghi/youtube-128.png">

        </div>

        <div id="author">
            <p>Mirko Treccarichi</p>
            <p>O46002272</p>
        </div>
    </footer>
</body>

</html>