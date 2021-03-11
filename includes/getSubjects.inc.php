<?php
require_once "connection.inc.php";
$branch = $_POST["branch"];
$semester = $_POST["semester"];

if ($branch != "" && $semester != "") {
  $sql = "SELECT `coursecode`, `coursename` FROM course WHERE `branchid` = ? AND semester = ?";
  $stmt = $mysqli->prepare($sql);
  $stmt->bind_param("ss", $branch, $semester);
  $stmt->execute();

  if($result = $stmt->get_result()){
    if ($result->num_rows > 0) {
      echo "<option value=''>Select subject</option>";
      while ($row = $result->fetch_assoc()) {
        echo "<option value='" . $row["coursecode"] . "'>" . $row["coursecode"] . " - " . $row["coursename"] . "</option>";
      }
    }
    else{
      echo "<option value=''>No data found</option>";
    }
  }else{
    echo "<option value=''>No data found</option>";
  }
}


  // if($result->num_rows > 0){
  //   while ($row = $result->fetch_assoc()) {
  //     echo "<option value='" . $row["coursecode"] . "'>" . $row["coursecode"] . " - " . $row["coursename"] . "</option>";
  //   }
  // }


?>