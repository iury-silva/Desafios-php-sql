<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <form action="tabuada.php" method="POST">
    <h1>Digite o seu numero</h1>
    <input type="number" name="num" placeholder="ex: 1,2,3...">
    <input type="submit" value="enviar">
  </form>
  <br>
  <hr>
  <?php
  $num = $_POST['num'];
  function tabuada($num, $i)
  {
    if ($i <= 10) {
      echo "$num X $i = " . $num * $i . "<br>";
      tabuada($num, $i + 1);
    }
  }

  tabuada($num, 1);

  ?>
</body>

</html>