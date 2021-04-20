<?php
if(!isset($_POST['submit'])){
  header("location: ../upload.php");
  echo "not working";
}
session_start();
include "connection.inc.php";

$uploadType = $_POST['uploadType'];
$branch = $_POST['branch'];
$semester = $_POST['semester'];
$course = $_POST['course'];
$title = $_POST['title'];
$submission = $_POST['submission'];
$detailInfo = $_POST['detailInfo'];
$professorId = $_SESSION['professorId'];
$today = date("Y-m-d");
$file = 1;

$uploadDir = '../asset/attachments/';

if($uploadType == "" || $branch == "" || $semester == "" || $course == "" ||$title == ""){
  header("Location: ../upload.php?error=emptyFields");
  exit();
}


if($uploadType === 'assignment'){
  if($submission == ""){
    header("Location: ../upload.php?error=emptySubmissionDate");
    exit;
  }
  $sql = "INSERT INTO `assignment`(`coursecode`, `title`, `data`, `provideddate`, `submissiondate`, `providedBy`, `attachment`) VALUES (?,?,?,?,?,?,?)";
  $stmt = $mysqli->prepare($sql);

  if($_FILES['attachment']['error'] == '0'){
    // If file is available
    $stmt->bind_param("ssssssi", $course, $title, $detailInfo, $today, $submission, $professorId, $file);
    if($stmt->execute()){
      $lastID = $stmt->insert_id;
      $targetFile = $uploadDir ."assignment" . $lastID . "." . strtolower(pathinfo($_FILES['attachment']['name'],PATHINFO_EXTENSION));
      if(move_uploaded_file($_FILES['attachment']['tmp_name'], $targetFile)){
        header("Location: ../upload.php?success=assignmentUpload");
      }
    }
  }
  else{
    // If file is not available
    $stmt->bind_param("ssssssi", $course, $title, $detailInfo, $today, $submission, $professorId, null);
    if($stmt->execute()){
      header("Location: ../upload.php?success=assignmentUpload");
    }
  }
}
else if($uploadType === 'notes'){
  $sql = "INSERT INTO `lecturenotes`(`coursecode`, `title`, `data`, `provideddate`,  `providedBy`, `attachment`) VALUES (?,?,?,?,?,?)";
  $stmt = $mysqli->prepare($sql);

  if($_FILES['attachment']['error'] == '0'){
    // If file is available
    $stmt->bind_param("sssssi", $course, $title, $detailInfo, $today, $professorId, $file);
    if($stmt->execute()){
      $lastID = $stmt->insert_id;
      $targetFile = $uploadDir . "lectureNote" . $lastID . "." . strtolower(pathinfo($_FILES['attachment']['name'],PATHINFO_EXTENSION));
      if(move_uploaded_file($_FILES['attachment']['tmp_name'], $targetFile)){
        header("Location: ../upload.php?success=notesUpload");
      }
    }
  }
  else{
    // If file is not available
    $stmt->bind_param("sssssi", $course, $title, $detailInfo, $today, $professorId, null);
    if($stmt->execute()){
      header("Location: ../upload.php?success=notesUpload");
    }
  }
}