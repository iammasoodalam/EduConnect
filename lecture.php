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
    ?>
    <div id="home-student">
      <div id="lectureNotes">
        <h2>Lecture Notes</h2>
        <?php
          $sqlLectureNotes = "SELECT * FROM lecturenotes WHERE coursecode IN (SELECT coursecode FROM course WHERE branchId = ? AND semester = ? ) ORDER BY provideddate DESC";
          $stmtLectureNotes = $mysqli->prepare($sqlLectureNotes);
          $stmtLectureNotes->bind_param("ii", $_SESSION['branch'], $_SESSION['semester']);
          $stmtLectureNotes->execute();
          if($result = $stmtLectureNotes->get_result()){
            if($result->num_rows > 0){
              while($row = $result->fetch_assoc()){
                ?>
                <div class="card">
                  <div class="card-head">
                    <div class="provided">Date: <?= $row['provideddate']; ?></div>
                  </div>
                  <h3><?=$row['coursecode'] . " - " . $row['title'] ?></h3>
                  <div class="card-data">
                    <?= $row['data'] ?>
                    <?php
                    if($row['attachment'] == 1){
                      $dir = "./asset/attachments/";
                      $list = scandir($dir);
                      $fileName = "/lectureNote" . $row['lectureId'] . "/i";
                      foreach ($list as $value) {
                        if(preg_match($fileName, $value)){
                          $fileName = $value;
                          break;
                        }
                      }
                      ?>
                      <hr>
                      <a href="./asset/attachments/<?= $fileName ?>">Attachment</a>
                      <?php
                    }
                    ?>
                  </div>
                  <p class="read-more">Read More <i class="fas fa-caret-down"></i></p>
                </div>
                <?php
              }
            }
          }
          
        ?>
      </div>
    </div>
    <?php
  } else {
    ?>
    <div id="home-professor">
      <div id="lectureNotes">
        <h2>Lecture Notes</h2>
        <?php
          $sqlLectureNotes = "SELECT * FROM lecturenotes WHERE providedBy = ? ORDER BY provideddate DESC";
          $stmtLectureNotes = $mysqli->prepare($sqlLectureNotes);
          $stmtLectureNotes->bind_param("s", $_SESSION['professorId']);
          $stmtLectureNotes->execute();
          if($result = $stmtLectureNotes->get_result()){
            if($result->num_rows > 0){
              while($row = $result->fetch_assoc()){
                ?>
                <div class="card">
                  <div class="card-head">
                    <div class="provided">Date: <?= $row['provideddate']; ?></div>
                  </div>
                  <h3><?=$row['coursecode'] . " - " . $row['title'] ?></h3>
                  <div class="card-data">
                    <?= $row['data'] ?>
                    <?php
                    if($row['attachment'] == 1){
                      $dir = "./asset/attachments/";
                      $list = scandir($dir);
                      $fileName = "/lectureNote" . $row['lectureId'] . "/i";
                      foreach ($list as $value) {
                        if(preg_match($fileName, $value)){
                          $fileName = $value;
                          break;
                        }
                      }
                      ?>
                      <hr>
                      <a href="./asset/attachments/<?= $fileName ?>">Attachment</a>
                      <?php
                    }
                    ?>
                  </div>
                  <p class="read-more">Read More <i class="fas fa-caret-down"></i></p>
                </div>
                <?php
              }
            } else{
              ?>
              <div class="card">
                <h3>Not uploaded any lecture notes</h3>
              </div>
              <?php
            }
          }
          
        ?>
      </div>
    </div>
    <?php
  }
  ?>
  
</main>

<?php include "./includes/footer.inc.php"; ?>