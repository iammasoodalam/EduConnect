<?php
require_once "connection.inc.php";
$evenOdd = $_POST["even-odd"];

if ($evenOdd != "") {
  $sql = "SELECT `coursecode`, `coursename` FROM course WHERE semester%2 = ? ORDER BY branchid, semester";
  $stmt = $mysqli->prepare($sql);
  $stmt->bind_param("i", $evenOdd);
  $stmt->execute();

  if ($result = $stmt->get_result()) {
    if ($result->num_rows > 0) {
      echo "<option value=''>Select subject</option>";
      while ($row = $result->fetch_assoc()) {
        echo "<option value='" . $row["coursecode"] . "'>" . $row["coursecode"] . " - " . $row["coursename"] . "</option>";
      }
    } else {
      echo "<option value=''>No data found</option>";
    }
  } else {
    echo "<option value=''>No data found</option>";
  }
}
