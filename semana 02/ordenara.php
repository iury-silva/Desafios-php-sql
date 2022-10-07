<?php
function Ordenarne()
{
  $firstArray = array(10, 7, 8, 3, 5, -1, 6, 4, 0, 1, 2, 9);
  $saida = array();
  for ($x = 0; $x <= 100; $x++) {
    in_array($x, $firstArray) ? array_push($saida, $x) : false;
  }
  return $saida;
}


$Ordenarne = Ordenarne();
foreach ($Ordenarne as $value) {
  echo $value . "<br />";
}
