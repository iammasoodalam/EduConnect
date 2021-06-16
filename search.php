<?php include "includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
if ($_SESSION['userType'] == "admin") {
  header("Location: index.php");
}
?>

<main id="search">
  <?php include "./includes/schedule-section.inc.php";
  if ($_SESSION['userType'] == 'professor') {
  ?>
    <div id="search-professor">
      <h2>Search Student</h2>
      <label for="searchBy">Search Using</label>
      <select name="searchBy" id="searchBy">
        <option value="">Search Using</option>
        <option value="name">Name</option>
        <option value="enrollmentNo">Enrollment number</option>
        <option value="facultyNo">Faculty Number</option>
      </select>
      <label for="searchInput">Type to Search</label>
      <input type="text" name="searchInput" id="searchInput">
      <div id="searchResult">
        <!--Search result will be shown here -->
      </div>
    </div>
  <?php
  } else {
  ?>
    <div id="search-student">
      <h2>Search Professor</h2>
      <label for="searchInput">Professor Name</label>
      <input type="text" name="searchInput" id="searchInput">
      <div id="searchResult">
        <!--Search result will be shown here -->
      </div>
    </div>
  <?php
  }
  ?>

</main>
<?php include "includes/footer.inc.php"; ?>