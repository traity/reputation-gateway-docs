<?php
  // php-jwt is used in this example: https://github.com/firebase/php-jwt
  use \Firebase\JWT\JWT;

  $url           = 'https://rg.traity.com/score';
  $authorization = JWT::encode(array('request' => $_GET['request']), APP_SECRET);
  $header        = array('Accept: application/json',
                         'Authorization: Bearer '.$authorization);

  $curl = curl_init();
  curl_setopt($curl, CURLOPT_URL, $url);
  curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($curl, CURLOPT_HTTPGET, true);
  $reply = curl_exec($curl);

  //error handling for cURL
  if ($reply === false) {
     throw new Exception('Curl error: ' . curl_error($curl));
  }
  curl_close($curl);

  $decoded_data = json_decode($reply, true);
  echo '<pre>';
  print_r($decoded_data);
?>

