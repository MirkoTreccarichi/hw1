 <?php
    include "auth.php";

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
    <script src="scripts/api.js" defer="true"></script>
    
</head>

<body>
    <header>
        <nav>

            <div id="logo">
                <img id="logoimg" src="img/Smartket/SmartketGreen.png">
                <div id="comp">Smartket&Co</div>
            </div>


            <div class="link">

                <?php
                    $text = "login";
                    if(checkAuth())
                        $text = "Area Personale";

                    echo "<a class='login' href='login.php'>$text</a>";
                ?>
                
                
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

    </section>
    

       
    ' <section id="news">

    <div>
        <img src="img/saint-pierre-1633682_1920.jpg">
        <h1>
            Da oggi sempre più presenti in italia
        </h1>
    </div>
    <h2>
        Con oltre 150 punti vendita in più di 15 regioni diverse
    </h2>

    <div>
        <img src="img/knifes-1839061_1920.jpg">

    </div>
    <h2>
        Ogni giorno vi forniamo il meglio
    </h2>

    <div id="bio">
        <img src="img/cows-2641195_1920.jpg">
        <h1 id="bio">
            The greener the better
        </h1>
    </div>
    <h2>
        Bio è meglio! Scopri una nuova linea rispettosa dell\'ambiente
    </h2>
    </section>

    <h1 class="title">Scopri la notizie dello slowfood</h1>

    <section class="news grid" id="apiNews">

    </section>

    <h1 class="title">I nostri parteners</h1>

    <section class="parteners  grid" id="apiFinnhub">

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