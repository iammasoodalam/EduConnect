<?php 
require_once "./connection.inc.php";

$branch = $_POST["branch"];
$semester = $_POST["semester"];
$uploadType = $_POST["upload-type"];
$days = array( 
  "1"=> "monday", 
  "2"=> "tuesday", 
  "3"=> "wednesday", 
  "4"=> "thursday", 
  "5"=> "friday", 
  "6"=> "saturday");

foreach ($days as $key => $value) {
  for ($i=1; $i < 10; $i++) { 
    ${"_" . $key . $i} = $_POST[$value . "-period" . $i];
  }
}
if ($uploadType == "update") {
  if ($branch && $semester) {
    $sql = "UPDATE `schedule`
      SET `1st` = ? , `2nd` = ?, `3rd` = ?, `4th` = ? , `5th` = ?, `6th` = ?, `7th` = ?, `8th` = ? , `9th` = ?
      WHERE  `branchId` = ? AND `semesterId`= ? AND `day` = ?";
    $stmt = $mysqli->prepare($sql);
    if ($stmt === false) {
      trigger_error($mysqli->error, E_USER_ERROR);
      return;
    }

    foreach ($days as $key => $value) {
      for ($i=1; $i < 10; $i++) { 
        ${"period" . $i} = ${"_" . $key . $i};
        if (${"period" . $i} == "") {
          ${"period" . $i} = NULL;
        }
      }
      $stmt->bind_param("sssssssssiii", $period1 , $period2, $period3, $period4, $period5, $period6, $period7, $period8, $period9, $branch, $semester, $key);
      $stmt->execute();
    }
    $stmt->close();
  }
}
else {
  if ($branch && $semester) {
    $sql = "INSERT INTO `schedule`(`branchId`, `semesterId`, `day`, `1st`, `2nd`, `3rd`, `4th`, `5th`, `6th`, `7th`, `8th`, `9th`) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  
    $stmt = $mysqli->prepare($sql);
  
    foreach ($days as $key => $value) {
      for ($i=1; $i < 10; $i++) { 
        ${"period" . $i} = ${"_" . $key . $i};
        if (${"period" . $i} == "") {
          ${"period" . $i} = NULL;
        }
      }
      $stmt->bind_param("iiisssssssss", $branch, $semester, $key, $period1 , $period2, $period3, $period4, $period5, $period6, $period7, $period8, $period9);
      $stmt->execute();
    }

  }  
}
