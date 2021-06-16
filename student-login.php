<?php
require_once "./includes/header.inc.php";
?>
<main id="login">
  <div id="student-login">
    <form action="includes/student-login.inc.php" id="student-login-form" method="POST">
      <div class="heading">Student Login</div>
      <ul class="instruction">
        <li>Use your Enrollment number provided by the Administration, like (GL2402).</li>
        <li>If you are never reset your password then your password is the same as provided by the Administrator.</li>
      </ul>
      <div class="result"></div>
      <i class="fas fa-user"></i>
      <label for="enrollment">Enrollment Number</label>
      <input type="text" name="enrollment" id="enrollment">
      <label for="password">Password</label>
      <input type="password" name="password" id="password">
      <input type="submit" value="Login">
    </form>
  </div>

</main>



<?php require_once "./includes/footer.inc.php";
