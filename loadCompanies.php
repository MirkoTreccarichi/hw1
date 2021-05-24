<?php
  //curl finnhub API
  $endpoint_market = 'https://finnhub.io/api/v1/stock/profile2?';
  $apikey_market = 'c1vetqqad3ibv04ba3g0';
  if(isset($_GET["symbol"])){
      $symb = $_GET["symbol"];
       $url = $endpoint_market.'symbol='. $symb .'&token=' . $apikey_market;
       $curl = curl_init();
       curl_setopt($curl, CURLOPT_URL,$url);
       curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
       $dati = curl_exec($curl);
  }
  else
    $dati = "errore";
    
  echo $dati ;
  curl_close($curl);
  
?>