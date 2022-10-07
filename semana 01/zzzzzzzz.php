<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DATA</title>
  <link rel="stylesheet" href="data.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@200;700&display=swap" rel="stylesheet">
</head>

<body>

  <div class="data">
    <h2>Conversão de datas</h2>
    <h3>De Americano para formato Brasileiro</h3> <br>

    <?php

    $originalData = "2010-01-15";
    $data = strtotime($originalData);


    echo "<strong> $originalData </strong>";
    echo "<br>";

    echo "<strong> Resultado = </strong>";

    echo date("d/m/Y", $data);
    ?>
  </div>

</body>

</html>