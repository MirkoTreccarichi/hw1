<?php
    include "auth.php";
    if(checkAuth()) 
        header("Location: customer.php");
   


    if (!empty($_POST["email"]) && !empty($_POST["password"]) )
    {   
        $db = "hm1";
        $conn = mysqli_connect("localhost","root","",$db);

        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);

        $searchField = "email";

        $query = "SELECT * FROM cliente WHERE $searchField = '$email'";

        $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

        if(mysqli_num_rows($res) > 0 ){
            $entry = mysqli_fetch_assoc($res);

            if(password_verify($_POST["password"], $entry["password"])){
                $_SESSION["username"] = $_POST["email"];    
                $_SESSION["user_id"] = $entry["id"];
                header("Location: customer.php");
                mysqli_free_result($res);
                mysqli_close($conn);
                exit;
            }
        }

  
        
        $error = "Username e/o password errati.";
    }
    else if (isset($_POST["username"]) || isset($_POST["password"])) {
        $error = "Inserisci username e password.";

    }
    //myemail/username : admin
    //mypassword : admin
    if(isset($error))
        echo($error);
?> 
<!DOCTYPE html>
<html lang="it">

<head>
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login</title>
    <link rel="stylesheet" href="styles/login.css">
</head>

<body>
    

    <section>
    <h1 class="comp">Benvenuto!</h1>
        <div class="logo">
            <img class="logoimg" src="img/Smartket/SmartketWhite.png">
            <div class="comp">Smartket</div>
        </div>

        <form name='login' method='post'>
            <div class="email">
                <label for='email'>Email</label>
                <input type='text' name='email'>
            </div>
            <div class="password">
                <label for='password'>Password</label>
                <input type='password' name='password'>
            </div>
            <div class="submit">
                <input type='submit' value="Accedi">
            </div>
        </form>
        <div class="signup">Non hai un account ? <a href="signup.php">Registrati !</a></div>
    </section>

    <footer>
        <div id="logo">
            <img id="logoimg" src="img/Smartket/SmartketWhite.png" alt="">
            <div id="comp">Smartket&Co</div>
        </div>

        <div id="author">
            <p>Mirko Treccarichi</p>
            <p>O46002272</p>
        </div>
    </footer>

</body>

</html>