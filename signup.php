 <?php
    session_start();

    if(isset($_SESSION["_user_id"]))
       header("Location: login.php");

    if (!empty($_POST["email"]) && !empty($_POST["password"]) && !empty($_POST["confirm_password"])
         && !empty($_POST["name"]) && !empty($_POST["surname"]) && !empty($_POST["birthdate"]) ){
        $db = "hm1";
        $conn = mysqli_connect("localhost","root","",$db);

        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $surname = mysqli_real_escape_string($conn, $_POST['surname']);
        $birthdate = mysqli_real_escape_string($conn, $_POST['birthdate']);

        $query = "SELECT email FROM users WHERE email = '$email'";
        $res = mysqli_query($conn, $query);
        if (mysqli_num_rows($res) > 0) {
            $error[] = "email già utilizzata";
        }

        


        if (count($error) == 0) {

            $password = mysqli_real_escape_string($conn, $_POST['password']);
            $password = password_hash($password, PASSWORD_BCRYPT);

            $query = "INSERT INTO cliente(nome, cognome, data_nascita,email,password) VALUES('$name', '$surname','$birthdate','$email','$password')";

            if (mysqli_query($conn, $query)) {
                $_SESSION["username"] = $_POST["email"];
                $_SESSION["user_id"] = mysqli_insert_id($conn);
                mysqli_close($conn);
                header("Location: home.php");
                exit;
            } else {
                $error[] = "Errore di connessione al Database";
            }
        }

        mysqli_close($conn);

            
    }
    else if (isset($_POST["email"]) || isset($_POST["password"])) {
        $error = "Inserisci email e password.";
        }

    if(isset($error))
        echo($error);
        //myemail/username : admin
        //mypassword : admin
?>  

<!DOCTYPE html>
<html lang="it">

<head>
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Signup</title>
    <link rel="stylesheet" href="styles/signup.css">
    <script src="scripts/signup.js" defer="true"></script>

</head>

<body>

    <!-- SECTION -->
    <section>
    <h1 class="comp">Registrati!</h1>
        <div class="logo">
            <img class="logoimg" src="img/Smartket/SmartketWhite.png">
            <div class="comp">Smartket</div>
        </div>
        <!-- FORM -->
        <form name='signup' method='post'>
            <!-- NAME -->
            <div class="name">
                <label for="name">Nome</label>
                <input type="text" name="name">
            </div>
            <!-- SURNAME -->
            <div class="surname">
                <label for="surname">Cognome</label>
                <input type="text" name="surname">
            </div>
            <!-- BIRTHDATE -->
            <div class="birthdate">
                <label for="birthdate">Data di Nascita</label>
                <input type="date" name="birthdate">
            </div>
            <!-- EMAIL -->
            <div class="email">
                <label for="email">Email</label>
                <input type="text" name="email">
            </div>
            <!-- PASSWORD  -->
            <div class="password">
                <label for='password'>Password</label>
                <input type='password' name='password'>
            </div>
            <!-- CONFIRM PASSWORD  -->
            <div class="confirm_password">
                <label for='confirm_password'>Ripeti la Password</label>
                <input type='password' name='confirm_password'>
            </div>
            <!-- REMEMBER CHECKBOX  -->
            <div class="remember">
                <label for='remember'></label>Ricorda l'accesso</label>
                <input type='checkbox' name='remember' value="1">
            </div>
            <div class="submit">
                <input type='submit' value="Registrati">
            </div>
        </form>
        <div class="error_display hidden"></div>
        <div class="signup">Hai già un account ? <a href="login.php ">Fai il login !</a></div>
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