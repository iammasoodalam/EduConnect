<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "educonnect";
$mysqli = new mysqli($host, $user, $pass, $db);

if ($mysqli->connect_error) {
  die("Connection failed: " . $mysqli->connect_error);
}
