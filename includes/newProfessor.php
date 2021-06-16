<?php
require_once "connection.inc.php";

$professorId = test_input($_POST["professorId"]);
$professorName = test_input($_POST["professorName"]);
$qualification = test_input($_POST["qualification"]);
$profEmailId = test_input($_POST["profEmailId"]);
$profPhone = test_input($_POST["profPhone"]);
$profPassword = test_input($_POST["profPassword"]);
$profJoinDate = test_input($_POST["profJoinDate"]);
$profAddress = test_input($_POST["profAddress"]);

$hashedpass = password_hash($profPassword, PASSWORD_DEFAULT);

function test_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

$sql = "INSERT INTO `professor`
    (`professorId`, `name`, `qualification`, `address`, `joindate`, `emailId`, `password`)
    VALUES (?, ?, ?, ?, ?, ?, ?);";

$phoneQuery = "INSERT INTO `professorphone`(`professorId`, `phone`) VALUES (?,?)";

$stmt = $mysqli->prepare($sql);
$phonestmt = $mysqli->prepare($phoneQuery);

if ($stmt && $phonestmt) {
  $stmt->bind_param("sssssss", $professorId, $professorName, $qualification, $profAddress, $profJoinDate, $profEmailId, $hashedpass);
  $phonestmt->bind_param("ss", $professorId, $profPhone);

  if ($stmt->execute() && $phonestmt->execute()) {
    $stmt->close();
    $phonestmt->close();
?>
    <div id="close" onclick="closeOutput()">&times;</div>
    <table>
      <tr>
        <th>Field</th>
        <th>Value
      </tr>
      <tr>
        <td>Professor ID</td>
        <td><?php echo $professorId; ?></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><?php echo $professorName; ?></td>
      </tr>
      <tr>
        <td>Qualification</td>
        <td><?php echo $qualification; ?></td>
      </tr>
      <tr>
        <td>Email ID</td>
        <td><?php echo $profEmailId; ?></td>
      </tr>
      <tr>
        <td>Phone</td>
        <td><?php echo $profPhone; ?></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><?php echo $profPassword; ?></td>
      </tr>
      <tr>
        <td>Join date</td>
        <td><?php echo $profJoinDate; ?></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><?php echo $profAddress; ?></td>
      </tr>
    </table>
  <?php
  } else {
  ?>
    <div id="close" onclick="closeOutput()">&times;</div>
    <h2>Data duplicacy found...</h2>
    <h2>"<?php echo "$professorId" ?> is already inserted.</h2>
<?php
  }
} else {
  echo $stmt->error;
  echo $phonestmt->error;
}
?>