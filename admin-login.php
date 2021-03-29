<?php
require_once "./includes/header.inc.php";
?>
<main id="login">
  <div id="admin-login">
    <form action="./includes/admin-login-inc.php" id="admin-login-form" method="POST">
      <div class="heading">Admin Login</div>
      <ul class="instruction">
        <li>Use your User ID provided by the Head Admininistrator.</li>
        <li>If you had never reset your password then your password is the same as provided by the Administrator.</li>
      </ul>
      <div class="result"></div>
      <i class="fas fa-user"></i>
      <label for="userId">User ID</label>
      <input type="text" name="userId" id="userId" required>
      <label for="password">Password</label>
      <input type="password" name="password" id="password" required>
      <input type="submit" value="Login">
    </form>
  </div>
  
</main>



<?php require_once "./includes/footer.inc.php";