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

    if (isset($_POST['email'])) {

      if (!$email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL))
        echo "Email incorreto meu jovem!!";
      else if ($email < 256)
        echo "Email enviado com sucesso";
    }


    ?> <form action="testeEmail.php" method="POST">

      <input type="text" name="email" placeholder="Digite seu email">
      <input type="submit" value="Enviar">

    </form>
  </div>
</body>

</html>