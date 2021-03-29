<?php
require "./includes/header.inc.php";
?>
<main id="contact">
  <div class="contact-form">
    <h2>Contact Me</h2>
    <form action="./includes/contact.inc.php" method="post" id="contact-form">
      <label for="userName">Name</label>
      <input type="text" name="userName" id="userName">
      <label for="userEmail">Email</label>
      <input type="email" name="userEmail" id="userEmail">
      <label for="message">Message</label>
      <textarea name="message" id="message" cols="5" rows="10"></textarea>
      <input type="submit" value="Send Message">
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
require "./includes/footer.inc.php";
?>