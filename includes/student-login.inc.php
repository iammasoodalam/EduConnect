<?php
require_once "./connection.inc.php";

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

$userName = test_input($_POST['enrollment']);
$password = test_input($_POST['password']);

$sql = "SELECT `enrollment`, `password` FROM `student` WHERE `enrollment` = ?";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $userName);
$stmt->execute();

$result = $stmt->get_result();

if($result->num_rows > 0){
  $row = $result->fetch_assoc();
  if(password_verify($password, $row['password'])){
    session_start();
    $_SESSION['userName'] = $userName;
    $_SESSION['userType'] = "student";
    echo "verified";
    exit();
  } else {
    echo "Please check your password and try again";
  }
}
else{
  echo "Please check your Enrollment Number and Password";
}