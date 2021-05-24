    <?php

    //the email already exsists ?
    $dbconfig = [
        'host'     => '127.0.0.1',
        'name'     => 'hm1',
        'user'     => 'root',
        'password' => ''
        ];

    if(isset($_POST["email"])){
        $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']) or die(mysqli_error($conn));

        $inputEmail = $_POST["email"];
        $email = mysqli_real_escape_string($conn,$inputEmail);
        $query = "SELECT email FROM cliente WHERE email = '$email'";
        $result = mysqli_query($conn, $query);
        $free = false;
        if($result != false)
            if(mysqli_num_rows($result) == 0)
                $free = true;
       
        
        
    }
    else
         $free = false;
        


   echo json_encode($free);

   mysqli_close($conn);

    
    ?>