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
        rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Smartket</title>
    <link rel="stylesheet" href="styles/home.css">
    <script src="scripts/script.js" defer="true"></script>
    
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

        <div id="slogan">
            <h1>
                La spesa che ti piace
            </h1>
            <h2>
                il futuro è a un passo da te
            </h2>
        </div>

    </header>

    <article>
        
    <section class="poster">

        <h1> <a href="checkout.php">Fai la lista , ritira dopo ! </a> </h1>
    

    </section>
           
        
    <section class="poster">
        
        
        <h1>Scegli il tuo punto vendita preferito</h1>


        <div class="favorites hidden">
            <h3>I tuoi preferiti</h3>

            <div class="grid">

            </div>
        </div>

        <div class="choices">
            <h3>Clicca sul mi piace</h3>
            <span>Cerca i tuoi preferiti </span><input type="search">

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