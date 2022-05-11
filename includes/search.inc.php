<?php
require_once "connection.inc.php";

$searchInput = $_GET['searchInput'];
if ($searchInput == "") {
  exit();
}
$searchInput = "%$searchInput%";

if (isset($_GET['searchBy'])) {
  $searchBy = $_GET['searchBy'];
  if ($searchBy == "") {
    exit();
  }
  if ($searchBy == "name") {
    $sql = "SELECT s.enrollment, s.facultyNo, s.name, s.emailId, p.phone FROM student s INNER JOIN studentphone p USING(enrollment) WHERE s.name LIKE ?";
  } else if ($searchBy == "enrollmentNo") {
    $sql = "SELECT s.enrollment, s.facultyNo, s.name, s.emailId, p.phone FROM student s INNER JOIN studentphone p USING(enrollment) WHERE s.enrollment LIKE ?";
  } else if ($searchBy == "facultyNo") {
    $sql = "SELECT s.enrollment, s.facultyNo, s.name, s.emailId, p.phone FROM student s INNER JOIN studentphone p USING(enrollment) WHERE s.facultyNo LIKE ?";
  }
  $stmt = $mysqli->prepare($sql);
  $stmt->bind_param("s", $searchInput);
  $stmt->execute();
  if ($result = $stmt->get_result()) {
    if ($result->num_rows > 0) {
      echo "<table>";
      echo "<th>S. No.</th><th>Enrollment No.</th><th>Faculty No.</th><th>Name</th><th>Phone No.</th><th>Email Id</th>";
      $sno = 1;
      while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $sno . "</td>";
        echo "<td>" . $row['enrollment'] . "</td>";
        echo "<td>" . $row['facultyNo'] . "</td>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['phone'] . "</td>";
        echo "<td>" . $row['emailId'] . "</td>";
        echo "</tr>";
        $sno++;
      }
      echo "</table>";
    }
  }
} else {
  $sql = "SELECT p.name, p.emailId, pp.phone FROM professor p 
  INNER JOIN professorphone pp USING(professorId) 
  WHERE p.name LIKE ? ORDER BY p.name";

  $stmt = $mysqli->prepare($sql);
  $stmt->bind_param("s", $searchInput);
  $stmt->execute();
  $result = $stmt->get_result();

  if ($result->num_rows > 0) {
    echo "<table>";
    echo "<tr><th>S. No.</th><th>Name</th><th>Phone Number</th><th>Email Id</th></tr>";
    $sno = 1;
    while ($row = $result->fetch_assoc()) {
      echo "<tr>";
      echo "<td>" . $sno . "</td>";
      echo "<td>" . $row['name'] . "</td>";
      echo "<td>" . $row['phone'] . "</td>";
      echo "<td>" . $row['emailId'] . "</td>";
      echo "</tr>";
      $sno++;
    }
    echo "</table>";
  }
}
