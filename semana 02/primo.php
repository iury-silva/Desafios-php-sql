<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Numeros Primos</title>
  <link rel="stylesheet" href="">
</head>

<body>
  <form method="POST">
    Insira um numero:<input type="number" name="numero" placeholder="digite um numero">
    <input type="submit" value='Ver' name="primo">
  </form>
  <?php
  $num = $_POST['numero'];

  $k = 2;

  while ($k <= $num) {

    $i = 2;
    $primo = 1;

    while ($i < $k) {
      if ($k % $i == 0) {
        $primo = 0;
        break;
      }
      $i++;
    }
    if ($primo) {

      print $k . '<br>';
    }
    $k++;
  }
  if ($primo) {
    print $num . ' = é primo';
  } else if ($num <= 1) {
    print $num . ' = 0 e 1 não são primos';
  } else
    print $num . ' = nao é primo';
  ?>
</body>

</html>