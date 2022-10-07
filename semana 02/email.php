<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>email</title>
  <link rel="stylesheet" href="email.css">
</head>

<body>

  <div class="tudo">
    <h1>VALIDAR EMAIL</h1>

    <?php

    $email = $_POST['email'];

    $regex = "/^([a-zA-Z0-9\.]+@+[a-zA-Z]+(\.)+[a-zA-Z]{2,3})$/";

    if (preg_match($regex, $email))
      echo 'certo';
    else
      echo 'nao ta certo';


    ?> <form action="email.php" method="POST">

      <input type="text" name="email" placeholder="Digite seu email">
      <input type="submit" value="Enviar">

    </form>
  </div>
</body>

</html>