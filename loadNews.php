<?php
//curl news API
  $date_ =date("c");
    $url = 'https://newsapi.org/v2/everything?'.
    'q=slow%20food&'.
    'from='. $date_ . '&' .
    'language=it&' .
    'sortBy=popularity&' .
    'apiKey=c9b8835b7f2c419982ddc0396b5944cc';
  $curl = curl_init();
  curl_setopt($curl, CURLOPT_URL,$url);
  curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
  $dati = curl_exec($curl); 
  
  echo $dati;
  
  curl_close($curl);
?>