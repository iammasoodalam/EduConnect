<?php include "./includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
if($_SESSION['userType'] == "admin"){
  header("Location: uploader.php");
}
?>

<main id="home">
  <?php include "./includes/schedule-section.inc.php"; ?>
  
</main>

<?php include "./includes/footer.inc.php"; ?>