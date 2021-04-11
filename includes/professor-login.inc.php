<?php
require_once "./connection.inc.php";

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

$userName = test_input($_POST['empNumber']);
$password = test_input($_POST['password']);

$sql = "SELECT * FROM `professor` WHERE `professorId` = ?";
$phoneSql = "SELECT * FROM `professorPhone` WHERE `professorId` = ?";

$phoneStmt = $mysqli->prepare($phoneSql);
$phoneStmt->bind_param("s", $userName);

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $userName);
$stmt->execute();

$result = $stmt->get_result();

if($result->num_rows > 0){
  $row = $result->fetch_assoc();
  if(password_verify($password, $row['password'])){
    session_start();
    $_SESSION['userType'] = "professor";
    foreach ($row as $key => $value) {
      $_SESSION[$key] = $value;
    }
    $phoneStmt->execute();
    $phoneResult = $phoneStmt->get_result();
    $i = 1;
    while($row = $phoneResult->fetch_assoc()){
      $_SESSION['phone' . $i] = $row['phone'];
      $i++;
    }
    $_SESSION['phoneCount'] = --$i;
    echo "verified";
    exit();
  } else {
    echo "Please check your password and try again";
  }
}
else{
  echo "Please check your Employee Number and Password";
}