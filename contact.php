<?php
require "./includes/header.inc.php";
?>
<main id="contact">
  <div class="contact-form">
    <h2>Contact Me</h2>
    <form action="./contact.php" method="POST" id="contact-form">
      <label for="userName">Name</label>
      <input type="text" name="userName" id="userName" required>
      <label for="userEmail">Email</label>
      <input type="email" name="userEmail" id="userEmail" required>
      <label for="subject">Subject</label>
      <input type="text" name="subject" id="subject" required>
      <label for="message">Message</label>
      <textarea name="message" id="message" cols="5" rows="10" required></textarea>
      <input type="submit" name="submit" value="Send Message">
    </form>
  </div>
  <div class="contact-links">
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore blanditiis commodi officiis quidem libero nisi? Magnam similique vero architecto atque fugit dolorem soluta necessitatibus, enim facilis quam esse ex quo officiis doloremque ipsum voluptatem natus sit laborum! Nulla, quo eaque.</p>
    <div class="links">
      <i class="fas fa-map-marker-alt"></i><span>Aligarh, India</span><br>
      <i class="fas fa-phone-alt"></i><span>+91-(853) 282 0931</span><br>
      <i class="fas fa-envelope"></i><span>masoodalamofficial@gmail.com</span>
    </div>
  </div>
</main>

<?php
  # I've created mail function but it is not working. basically it returns true but mail is not going to provided mail account.
  if(isset($_POST['submit'])){
    $to = "130masoodalam@gmail.com";
    $subject = $_POST['subject'];
    $userEmail = "From: " . $_POST['userEmail'] . "\r\n";
    $message = $_POST['message'];
    $userName = $_POST['userName'];

    if(mail($to, $subject, $message, $userEmail)){
      header("Location: ./contact.php?o=messageSent");
    } else {
      header("Location: ./contact.php?o=error");
    }
  }

require "./includes/footer.inc.php";
?>