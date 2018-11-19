<?php
  // php-jwt is used in this example: https://github.com/firebase/php-jwt
  use \Firebase\JWT\JWT;

  $token = JWT::encode(array(
    'appId'        => APP_ID,
    'callback_url' => 'http://dev.example.com/finish'
  ), APP_SECRET);

?>

<a href="https://rg.traity.com/w/<?php echo $token ?>">Build Your TrustScore</a>

