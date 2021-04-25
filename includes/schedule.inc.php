<?php 
require_once "./connection.inc.php";

if($_POST['upload-for'] == "student"){
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
  if ($branch && $semester) {
    if ($uploadType == "update") {
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
      echo "<h2>Data <strong>Updated</strong> successfully.</h2>";
    }else if($uploadType == "insert"){
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
      echo "<h2>Data <strong>Inserted</strong> successfully.</h2>";
    }
    $query = "SELECT * FROM schedule WHERE `branchId` = ? AND `semesterId` = ? ORDER BY `day`";
    $tableStmt = $mysqli->prepare($query);
    $tableStmt->bind_param("ii", $branch, $semester);
    $tableStmt->execute();
    $result = $tableStmt->get_result();
    if ($result->num_rows > 1) {
      if ($rows = $result->fetch_assoc()) {
        $branchQuery = "SELECT `branchName` FROM `branch` WHERE `branchId` = ?";
        $branchStmt = $mysqli->prepare($branchQuery);
        $branchStmt->bind_param("i", $rows['branchId']);
        $branchStmt->execute();
        $branchResult = $branchStmt->get_result();
        $branchRows = $branchResult->fetch_assoc();
        echo "<div class='close-schedule-result' onclick= 'closeScheduleOutput()'>&times;</div>";
        echo "<h3>Branch: " . $branchRows['branchName'] . " Semester: " . $rows['semesterId'] . "</h3>";
      }
      echo "<table>";
        echo "<tr>";
        echo "<th></th>";
        echo "<th>I</th>";
        echo "<th>II</th>";
        echo "<th>III</th>";
        echo "<th>IV</th>";
        echo "<th>V</th>";
        echo "<th>VI</th>";
        echo "<th>VII</th>";
        echo "<th>VIII</th>";
        echo "<th>IX</th>";
      $i = 1;
      while ($rows = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . ucfirst($days[$i]) . "</td>";
        echo "<td>" . $rows['1st'] . "</td>";
        echo "<td>" . $rows['2nd'] . "</td>";
        echo "<td>" . $rows['3rd'] . "</td>";
        echo "<td>" . $rows['4th'] . "</td>";
        echo "<td>" . $rows['5th'] . "</td>";
        echo "<td>" . $rows['6th'] . "</td>";
        echo "<td>" . $rows['7th'] . "</td>";
        echo "<td>" . $rows['8th'] . "</td>";
        echo "<td>" . $rows['9th'] . "</td>";
        echo "</tr>";
        $i++;
      }
      echo "</table>";
    }
  }
  else {
    echo "<div class='close-schedule-result' onclick= 'closeScheduleOutput()'>&times;</div>";
    echo "<h2>Please select branch and semester and click on Get subjects.</h2>"; 
  }
}
else if($_POST['upload-for'] == "professor"){
  $evenOdd = $_POST["even-odd"];
  if($evenOdd == 0){
    $semesterName = "Even";
  }else{
    $semesterName = "Odd";
  }
  $professorId = $_POST['proschedule'];
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
  if (isset($evenOdd) && $professorId) {
    if ($uploadType == "update") {
      $sql = "UPDATE `schedulepro`
        SET `1st` = ? , `2nd` = ?, `3rd` = ?, `4th` = ? , `5th` = ?, `6th` = ?, `7th` = ?, `8th` = ? , `9th` = ?
        WHERE  `professorId` = ? AND `evenOdd`= ? AND `day` = ?";
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
        $stmt->bind_param("sssssssssiii", $period1 , $period2, $period3, $period4, $period5, $period6, $period7, $period8, $period9, $professorId, $evenOdd, $key);
        $stmt->execute();
      }
      $stmt->close();
      echo "<h2>Data <strong>Updated</strong> successfully.</h2>";
    }else if($uploadType == "insert"){
      $sql = "INSERT INTO `schedulepro`(`professorId`, `evenOdd`, `day`, `1st`, `2nd`, `3rd`, `4th`, `5th`, `6th`, `7th`, `8th`, `9th`) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
      $stmt = $mysqli->prepare($sql);
    
      foreach ($days as $key => $value) {
        for ($i=1; $i < 10; $i++) { 
          ${"period" . $i} = ${"_" . $key . $i};
          if (${"period" . $i} == "") {
            ${"period" . $i} = NULL;
          }
        }
        $stmt->bind_param("siisssssssss", $professorId, $evenOdd, $key, $period1 , $period2, $period3, $period4, $period5, $period6, $period7, $period8, $period9);
        $stmt->execute();
      }
      echo "<h2>Data <strong>Inserted</strong> successfully.</h2>";
    }
    $query = "SELECT * FROM schedulepro WHERE `professorId` = ? AND `evenOdd` = ? ORDER BY `day`";
    $tableStmt = $mysqli->prepare($query);
    $tableStmt->bind_param("si", $professorId, $evenOdd);
    $tableStmt->execute();
    $result = $tableStmt->get_result();
    if ($result->num_rows > 1) {
      if ($rows = $result->fetch_assoc()) {
        $branchQuery = "SELECT `name` FROM `professor` WHERE `professorId` = ?";
        $branchStmt = $mysqli->prepare($branchQuery);
        $branchStmt->bind_param("s", $professorId);
        $branchStmt->execute();
        $branchResult = $branchStmt->get_result();
        $branchRows = $branchResult->fetch_assoc();
        echo "<div class='close-schedule-result' onclick= 'closeScheduleOutput()'>&times;</div>";
        echo "<h3>Branch: " . $branchRows['name'] . " Semester: " . $semesterName . "</h3>";
      }
      echo "<table>";
        echo "<tr>";
        echo "<th></th>";
        echo "<th>I</th>";
        echo "<th>II</th>";
        echo "<th>III</th>";
        echo "<th>IV</th>";
        echo "<th>V</th>";
        echo "<th>VI</th>";
        echo "<th>VII</th>";
        echo "<th>VIII</th>";
        echo "<th>IX</th>";
      $i = 1;
      while ($rows = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . ucfirst($days[$i]) . "</td>";
        echo "<td>" . $rows['1st'] . "</td>";
        echo "<td>" . $rows['2nd'] . "</td>";
        echo "<td>" . $rows['3rd'] . "</td>";
        echo "<td>" . $rows['4th'] . "</td>";
        echo "<td>" . $rows['5th'] . "</td>";
        echo "<td>" . $rows['6th'] . "</td>";
        echo "<td>" . $rows['7th'] . "</td>";
        echo "<td>" . $rows['8th'] . "</td>";
        echo "<td>" . $rows[  '9th'] . "</td>";
        echo "</tr>";
        $i++;
      }
      echo "</table>";
    }
  }
  else {
    echo "<div class='close-schedule-result' onclick= 'closeScheduleOutput()'>&times;</div>";
    echo "<h2>Please select semester and Professor name and select subjects.</h2>";
  }
}