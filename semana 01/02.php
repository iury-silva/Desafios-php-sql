<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="data.css">
</head>

<body class="corpo">

  <div class="calend">
    <img src="./images/icons8-calendário-30.png" alt="calenn">
  </div>

  <div class="resultado">
    <?php

    $originalData = $_POST['data'];
    $data = strtotime($originalData);



    echo "<strong> $originalData </strong>";
    echo "<br>";

    echo "<strong> Resultado = </strong>";

    echo date("d/m/Y", $data);
    ?>
  </div>


</body>

</html>