<?php
require_once "connection.inc.php";

$sql = "SELECT `professorId`, `name`FROM `professor` ORDER BY name";

if ($result = $mysqli->query($sql)) {
  if ($result->num_rows > 0) {
    echo "<option value=''>Select professor</option>";
    while ($row = $result->fetch_assoc()) {
      echo "<option value='" . $row["professorId"] . "'>" . $row['professorId'] . " - " . $row["name"] . "</option>";
    }
  } else {
    echo "<option value=''>No data found</option>";
  }
} else {
  echo "<option value=''>No data found</option>";
}
