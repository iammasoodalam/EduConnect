<?php require_once "./includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
?>
<main id="profile">
  <?php include "./includes/schedule-section.inc.php" ?>
</main>




<?php require_once "./includes/footer.inc.php"; ?>