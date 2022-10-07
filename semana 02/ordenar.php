<?php

$arr = array(10, 7, 8, 3, 5, 6, 4, 0, 1, 2, 9);

function quicksort($array)
{
  count($array) < 2 ? $array : false;

  $left = $right = array();
  reset($array);
  $pivot_key  = key($array);
  $pivot  = array_shift($array);
  foreach ($array as $k => $v) {
    $v < $pivot ? $left[$k] = $v : $right[$k] = $v;;
  }
  return array_merge(quicksort($left), array($pivot_key => $pivot), quicksort($right));
}

$array  = quicksort($arr);

print_r($array);
