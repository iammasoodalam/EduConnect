<?php
require_once "./includes/header.inc.php";
?>
<main id="login">
  <div id="professor-login">
    <form action="includes/professor-login.inc.php" id="professor-login-form" method="POST">
      <div class="heading">Professor Login</div>
      <ul class="instruction">
        <li>Use your Emplyee number provided by the Administration, like (243234).</li>
        <li>If you are never reset your password then your password is the same as provided by the Administrator.</li>
      </ul>
      <div class="result"></div>
      <i class="fas fa-user"></i>
      <label for="empNUmber">Employee Number</label>
      <input type="text" name="empNumber" id="empNumber">
      <label for="password">Password</label>
      <input type="password" name="password" id="password">
      <input type="submit" value="Login">
    </form>
  </div>

</main>



<?php require_once "./includes/footer.inc.php";
