<?php require_once "./includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
if ($_SESSION['userType'] == 'student'){
  $BranchSql = "SELECT `branchName` FROM `branch` WHERE `branchId` = ?";
  $branchStmt = $mysqli->prepare($BranchSql);
  $branchStmt->bind_param("i", $_SESSION['branch']);
  $branchStmt->execute();
  $branchResult = $branchStmt->get_result();
  $branchRow = $branchResult->fetch_array();
  $_SESSION['branchName'] = $branchRow[0];
}

?>
<main id="profile">
  <?php include "./includes/schedule-section.inc.php" ?>
  <div id="profile-data">
    <?php
    if($_SESSION['profilepic'] != null){ ?>
      <div class="profileImage" style="background-image: url(./asset/profileImages/<?= $_SESSION['profilepic']; ?>);"></div>
    <?php } else { ?>
      <img src="./asset/profileImages/Default.png" alt="Profile Photo" class="profileImage">
    <?php }
    ?>
    <ul class="profile-data">
      <?php if ($_SESSION['userType'] == 'student'){ ?>
        <li><b>Name: </b><div><?= $_SESSION['name'] ?></div></li>
        <li><b>Enrollment No: </b><div><?= $_SESSION['enrollment'] ?></div></li>
        <li><b>Faculty No: </b><div><?= $_SESSION['facultyNo'] ?></div></li>
        <li><b>Father's Name: </b><div><?= $_SESSION['fathersName'] ?></div></li>
        <li><b>Phone No.: </b><?php
          for($i = 1; $i <= $_SESSION['phoneCount']; $i++){
            echo "<div>". $_SESSION['phone' . $i] . "</div>";
          }
        ?></li>
        <li><b>Email Id: </b><div><?= $_SESSION['emailId'] ?></div></li>
        <li><b>Date of Birth: </b><div><?= $_SESSION['dateOfBirth'] ?></div></li>
        <li><b>Address: </b><div><?= $_SESSION['address'] ?></div></li>
        <li><b>Join date: </b><div><?= $_SESSION['joindate'] ?></div></li>
        <li><b>Branch: </b><div><?= $_SESSION['branchName'] ?></div></li>
        <li><b>Semester: </b><div><?= $_SESSION['semester'] ?></div></li>
      <?php } else { ?>
        <li><b>Name: </b><div><?= $_SESSION['name'] ?></div></li>
        <li><b>Professor ID: </b><div><?= $_SESSION['professorId'] ?></div></li>
        <li><b>Qualification: </b><div><?= $_SESSION['qualification'] ?></div></li>
        <li><b>Phone No.: </b><?php
          for($i = 1; $i <= $_SESSION['phoneCount']; $i++){
            echo "<div>". $_SESSION['phone' . $i] . "</div>";
          }
        ?></li>
        <li><b>Email Id: </b><div><?= $_SESSION['emailId'] ?></div></li>
        <li><b>Address: </b><div><?= $_SESSION['address'] ?></div></li>
        <li><b>Join date: </b><div><?= $_SESSION['joindate'] ?></div></li>
      <?php } ?>
    </ul>
  </div>
</main>




<?php require_once "./includes/footer.inc.php"; ?>