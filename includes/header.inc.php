<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
  <script src="./js/jQuery.js"></script>
  <script src="./js/popper.js"></script>
  <link rel="shortcut icon" href="favicon.svg" type="image/x-icon">
  <link rel="stylesheet" href="./css/style.css?v=<?php echo time(); ?>">
  <title>EduConnect - A Single learning plateform to connect student and teachers directly</title>
</head>
<body>
  <header class="navbar">
    <div class="container">
      <a id="logo" href="#">Edu<span>Connect</span></a>
      <div class="hamburger">
        <span></span><span></span><span></span>
      </div>
      <nav>
        <ul class="primary-nav">
          <li onclick="toHome()">Home</li><li>About</li><li onclick="toContact()">Contact</li>
        </ul>
        <div class="login-cta">Login <i class="fas fa-caret-down"></i></div>
        <ul class="login-option">
          <li>Student</li><li>Professor</li><li onclick="toAdmin()">Admin</li>
        </ul>
      </nav>
    </div>
  </header>