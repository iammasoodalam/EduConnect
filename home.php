<?php 
require_once "./includes/header.inc.php";
require_once "./includes/connection.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
if($_SESSION['userType'] == "admin"){
  header("Location: uploader.php");
}
?>

<main id="home">
  <?php include "./includes/schedule-section.inc.php"; 
  if($_SESSION['userType'] == 'student'){
    $allData = [];
    $sqlAssignement = "SELECT * FROM assignment WHERE coursecode IN (SELECT coursecode FROM course WHERE branchId = ? AND semester = ? ) ORDER BY provideddate DESC";
    $stmtAssignment = $mysqli->prepare($sqlAssignement);
    $stmtAssignment->bind_param("ii", $_SESSION['branch'], $_SESSION['semester']);
    $stmtAssignment->execute();
    if($result = $stmtAssignment->get_result()){
      if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
          array_push($allData, $row);
        }
      }
    }
    $sqlLectureNotes = "SELECT * FROM lecturenotes WHERE coursecode IN (SELECT coursecode FROM course WHERE branchId = ? AND semester = ? ) ORDER BY provideddate DESC";
    $stmtLectureNotes = $mysqli->prepare($sqlLectureNotes);
    $stmtLectureNotes->bind_param("ii", $_SESSION['branch'], $_SESSION['semester']);
    $stmtLectureNotes->execute();
    if($result = $stmtLectureNotes->get_result()){
      if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
          array_push($allData, $row);
        }
      }
    }
    usort($allData, function($b, $a){
      return strtotime($a['provideddate']) <=> strtotime($b['provideddate']);
    });
    ?>
    <div id="home-student">
      <div class="card">
        <h3 class="welcome"><?= "Welcome Mr. " . $_SESSION['name'] ?></h3>
      </div>
      <?php
      foreach ($allData as $value) { ?>
        <div class="card">
          <div class="card-head">
            <div class="provided">Date: <?=$value['provideddate']; ?></div>
            <?php if(isset($value['submissiondate'])){ ?>
            <div class="submission">Submit By: <?= $value['submissiondate']; ?></div>
            <?php } ?>
          </div>
          <h3><?=$value['coursecode'] . " - " . $value['title'] ?></h3>
          <div class="card-data">
            <?php 
            echo $value['data'];
            if($value['attachment']  == 1){
              $dir = "./asset/attachments/";
              $list = scandir($dir);
              if(isset($value['submissiondate'])){
                $fileName = "/assignment" . $value['assignmentId'] . "/i";
              } else {
                $fileName = "/lectureNote" . $value['lectureId'] . "/i";
              }
              foreach ($list as $value) {
                if(preg_match($fileName, $value)){
                  $fileName = $value;
                  break;
                }
              }
              ?> <hr>
              <a href="./asset/attachments/<?= $fileName ?>" id="attachment"><i class="fas fa-file"></i>  Attachment</a> 
              <?php
            }
            ?>
          </div>
          <p class="read-more">Read More <i class="fas fa-caret-down"></i></p>
        </div>
      <?php } ?>
    </div>
    <?php 
  } 
  else 
  { 
    $allData = [];
    $sqlAssignement = "SELECT * FROM assignment WHERE providedBy = ? ORDER BY provideddate DESC";
    $stmtAssignment = $mysqli->prepare($sqlAssignement);
    $stmtAssignment->bind_param("s", $_SESSION['professorId']);
    $stmtAssignment->execute();
    if($result = $stmtAssignment->get_result()){
      if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
          array_push($allData, $row);
        }
      }
    }
    $sqlLectureNotes = "SELECT * FROM lecturenotes WHERE providedBy = ? ORDER BY provideddate DESC";
    $stmtLectureNotes = $mysqli->prepare($sqlLectureNotes);
    $stmtLectureNotes->bind_param("s", $_SESSION['professorId']);
    $stmtLectureNotes->execute();
    if($result = $stmtLectureNotes->get_result()){
      if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
          array_push($allData, $row);
        }
      } 
    }
    usort($allData, function($b, $a){
      return strtotime($a['provideddate']) <=> strtotime($b['provideddate']);
    });
    ?>
    <div id="home-professor">
      <div class="card">
        <h3 class="welcome"><?= "Welcome Mr. " . $_SESSION['name'] ?></h3>
      </div>
      <?php
      foreach ($allData as $row){ ?>
      <div class="card">
        <div class="card-head">
          <div class="provided">Date: <?= $row['provideddate']; ?></div>
          <?php if(isset($row['submissiondate'])){ ?>
            <div class="submission">Submit By: <?= $row['submissiondate']; ?></div>
          <?php } ?>
        </div>
        <h3><?=$row['coursecode'] . " - " . $row['title'] ?></h3>
        <div class="card-data">
          <?= $row['data'] ?>
          <?php
          if($row['attachment'] == 1){
            $dir = "./asset/attachments/";
            $list = scandir($dir);
            if(isset($row['submissiondate'])){
              $fileName = "/assignment" . $row['assignmentId'] . "/i";
            } else {
              $fileName = "/lectureNote" . $row['lectureId'] . "/i";
            }
            foreach ($list as $value) {
              if(preg_match($fileName, $value)){
                $fileName = $value;
                break;
              }
            }
            ?>
            <hr>
            <a href="./asset/attachments/<?= $fileName ?>" id="attachment"><i class="fas fa-file"></i>  Attachment</a>
            <?php
          }
          ?>
        </div>
        <p class="read-more">Read More <i class="fas fa-caret-down"></i></p>
      </div>
      <?php } ?>
    </div>
    <?php
  }
  ?>
  
</main>

<?php include "./includes/footer.inc.php"; ?>