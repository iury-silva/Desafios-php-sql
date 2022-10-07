<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>results</title>
  <link rel="stylesheet" href="fibonacci.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=El+Messiri:wght@400;700&display=swap" rel="stylesheet">

</head>

<body>

  <div class="res">
    <?php

    function fibonacci($valor)
    {


      $num = $_POST['num'];

      $valor1 = 0;
      $valor2 = 1;
      $saida = 0;




      echo $valor1 . "<br>";
      echo $valor2 . "<br>";

      for ($i = 0; $i <= $valor; $i++) {

        $saida = $valor1 + $valor2;

        $valor1 = $valor2;

        $valor2 = $saida;


        if ($saida < $num) {

          echo $saida . "<br>";
        }
      }
    }

    echo "<3" . fibonacci(99999999);

    ?>
  </div>
  <div class="img">

    <img src="./images/Bob-PNG-Clipart.png" alt="eobob">

  </div>

</body>

</html>