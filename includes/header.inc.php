<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="shortcut icon" href="favicon.svg" type="image/x-icon">
  <link rel="stylesheet" href="./css/style.css?v=<?php echo time(); ?>">
  <title>EduConnect - A Single learning plateform to connect student and teachers directly</title>
</head>
<body>
  <?php 
  session_start(); 
  date_default_timezone_set("Asia/Kolkata");
  ?>
  <header class="navbar">
    <div class="container">
      <a id="logo" onclick="toHome()">Edu<span>Connect</span></a>
      <div class="hamburger">
        <span></span><span></span><span></span>
      </div>
      <div class="overlay"></div>
      <nav>
        <?php
        if(empty($_SESSION)){
          ?>
          <ul class="primary-nav">
            <li onclick="toHome()">Home</li><li onclick="toAbout()">About</li><li onclick="toContact()">Contact</li>
          </ul>
          <div class="login-cta">Login <i class="fas fa-caret-down"></i></div>
          <ul class="login-option">
            <li onclick="toStudent()">Student</li><li onclick="toProfessor()">Professor</li><li onclick="toAdmin()">Admin</li>
          </ul>
          <?php
        } else {
          include "./includes/connection.inc.php";
          if($_SESSION['userType'] == "professor"){
            ?>
            <ul class="primary-nav">
              <li onclick="toHome()">Home</li><li onclick="toAssignment()">Assignment</li><li onclick="toLectureNotes()">Lecture Notes</li><li onclick="toUpload()">Upload</li><li onclick="toSearch()">Search</li><li onclick="toProfile()">Profile</li>
            </ul>
            <?php
          } else if($_SESSION['userType'] == "student"){
            ?>
            <ul class="primary-nav">
              <li onclick="toHome()">Home</li><li onclick="toAssignment()">Assignment</li><li onclick="toLectureNotes()">Lecture Notes</li><li onclick="toSearch()">Search</li><li onclick="toProfile()">Profile</li>
            </ul>
            <?php
          } else{
            ?>
            <ul class="primary-nav">
              <li id="nav-stu">Student</li><li id="nav-pro">Professor</li><li id="nav-schedule">Schedule</li>
            </ul>
            <?php
          }
          ?>
          <div class="login-cta" onclick="logout()">Logout</i></div>

          <?php
        }

        ?>
      </nav>
    </div>
  </header>