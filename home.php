<?php
include "./includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
}


include "./includes/footer.inc.php";
