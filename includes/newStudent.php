<?php
require_once "connection.inc.php";

$enrollment = test_input($_POST["enrollment"]);
$faculty = test_input($_POST["faculty"]);
$studentName = test_input($_POST["studentName"]);
$fathersName = test_input($_POST["fathersName"]);
$emailId = test_input($_POST["studEmailId"]);
$phone = test_input($_POST["studPhone"]);
$dateOfBirth = test_input($_POST["dateOfBirth"]);
$password = test_input($_POST["studPassword"]);
$joinDate = test_input($_POST["studJoinDate"]);
$branch = test_input($_POST["branch"]);
$semester = test_input($_POST["semester"]);
$address = test_input($_POST["studAddress"]);

$hashedpass = password_hash($password, PASSWORD_DEFAULT);

function test_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

$sql = "INSERT INTO `student`
    (`enrollment`, `facultyNo`, `name`, `fathersName`, `emailId`, `dateOfBirth`, `password`, `address`, `joinDate`, `branch`, `semester`)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

// $phoneQuery = "INSERT INTO `studentPhone`(enrollment, phone) VALUES (?, ?);";
$phoneQuery = "INSERT INTO `studentphone`(`enrollment`, `phone`) VALUES (?,?)";

$stmt = $mysqli->prepare($sql);
$phonestmt = $mysqli->prepare($phoneQuery);

if ($stmt && $phonestmt) {
  $stmt->bind_param("sssssssssss", $enrollment, $faculty, $studentName, $fathersName, $emailId, $dateOfBirth, $hashedpass, $address, $joinDate, $branch, $semester);
  $phonestmt->bind_param("ss", $enrollment, $phone);

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
        <td>Enrollment</td>
        <td><?php echo $enrollment; ?></td>
      </tr>
      <tr>
        <td>Faculty No.</td>
        <td><?php echo $faculty; ?></td>
      </tr>
      <tr>
        <td>Student's Name</td>
        <td><?php echo $studentName; ?></td>
      </tr>
      <tr>
        <td>Father's Name</td>
        <td><?php echo $fathersName; ?></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><?php echo $emailId; ?></td>
      </tr>
      <tr>
        <td>Phone</td>
        <td><?php echo $phone; ?></td>
      </tr>
      <tr>
        <td>Date of birth</td>
        <td><?php echo $dateOfBirth; ?></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><?php echo $password; ?></td>
      </tr>
      <tr>
        <td>Join Date</td>
        <td><?php echo $joinDate; ?></td>
      </tr>
      <tr>
        <td>Branch</td>
        <td><?php echo $branch; ?></td>
      </tr>
      <tr>
        <td>Semester</td>
        <td><?php echo $semester; ?></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><?php echo $address; ?></td>
      </tr>
    </table>
  <?php
  } else {
  ?>
    <div id="close" onclick="closeOutput()">&times;</div>
    <h2>Data duplicacy found...</h2>
    <h2><?php echo "$enrollment" ?> is already inserted.</h2>
<?php
  }
} else {
  echo $stmt->error;
  echo $phonestmt->error;
}
?>