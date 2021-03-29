<?php 
session_start();
session_destroy();
header("Location: ../index.php");
if(empty($_SESSION)){
  header("Location: ../index.php");
}