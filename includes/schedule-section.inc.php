<div id="schedule-section">
    <h2 class="heading">Today's Schedule</h2>
    <div id="time-table">
      <button id="previous" onclick="plusSlides(-1)"><</button>
      <button id="next" onclick="plusSlides(1)">></button>
      <?php
      $day = date('w');
      if($day > 0 && $day < 7){
        if($_SESSION['userType'] == "student"){
          $scheduleQuery = "SELECT * FROM `schedule` WHERE `branchId` = $_SESSION[branch] AND `semesterId` = $_SESSION[semester] AND `day` = $day";
          $scheduleResult = $mysqli->query($scheduleQuery);
          $schedule = $scheduleResult->fetch_assoc();
          foreach ($schedule as $key => $value) {
            if($value != null && !is_numeric($value)){
              ?><div class="period"><div class="time"><?php
              switch ($key) {
                case '1st':
                  echo "08:00<br>|<br>08:50";
                  break;
                case '2nd':
                  echo "08:50<br>|<br>09:40";
                  break;
                case '3rd':
                  echo "09:40<br>|<br>10:30";
                  break;
                case '4th':
                  echo "10:30<br>|<br>11:20";
                  break;
                case '5th':
                  echo "11:20<br>|<br>12:10";
                  break;
                case '6th':
                  echo "12:10<br>|<br>13:00";
                  break;
                case '7th':
                  echo "14:00<br>|<br>14:50";
                  break;
                case '8th':
                  echo "15:50<br>|<br>15:40";
                  break;
                case '9th':
                  echo "16:40<br>|<br>16:30";
                  break;
                default:
                  echo "Free";
                  break;
              }
              ?></div><div class="subject"><?php
              echo "<h3>" . $value . "</h3>";

              $subjectQuery = "SELECT coursename FROM `course` WHERE `coursecode` = ?";
              $subjectStmt = $mysqli->prepare($subjectQuery);
              $subjectStmt->bind_param("s", $value);
              $subjectStmt->execute();
              $subjectResult = $subjectStmt->get_result();
              $subject = $subjectResult->fetch_assoc();
              echo "<div class=\"subject-name\">" . $subject['coursename'] . "</div>";

              $professorQuery = "SELECT * FROM professorteaches LEFT JOIN professor ON professorteaches.professorId = professor.professorId WHERE professorteaches.coursecode = ?";
              $professorStmt = $mysqli->prepare($professorQuery);
              $professorStmt->bind_param("s", $value);
              $professorStmt->execute();
              $professorResult = $professorStmt->get_result();
              while($professorRow = $professorResult->fetch_assoc()){
                echo "<div class=\"professor-name\">Mr. " . $professorRow['name']. "</div>";
              }
              echo "</div></div>";

            }
          }
        } else if($_SESSION['userType'] == 'professor'){
          if(date("m") < 6) {
            $evenOdd = 0;
          } else {
            $evenOdd = 1;
          }
          $scheduleQuery = "SELECT * FROM `schedulepro` WHERE `professorId` = ? AND `evenOdd` = ? AND `day` = ?";
          $scheduleStmt = $mysqli->prepare($scheduleQuery);
          $scheduleStmt->bind_param("iii", $_SESSION['professorId'], $evenOdd, $day);
          $scheduleStmt->execute();
          $scheduleResult = $scheduleStmt->get_result();
          if($scheduleResult->num_rows > 0){
            $schedule = $scheduleResult->fetch_assoc();
            foreach ($schedule as $key => $value) {
              if($value != null && !is_numeric($value)){
                ?><div class="period"><div class="time"><?php
                switch ($key) {
                  case '1st':
                    echo "08:00<br>|<br>08:50";
                    break;
                  case '2nd':
                    echo "08:50<br>|<br>09:40";
                    break;
                  case '3rd':
                    echo "09:40<br>|<br>10:30";
                    break;
                  case '4th':
                    echo "10:30<br>|<br>11:20";
                    break;
                  case '5th':
                    echo "11:20<br>|<br>12:10";
                    break;
                  case '6th':
                    echo "12:10<br>|<br>13:00";
                    break;
                  case '7th':
                    echo "14:00<br>|<br>14:50";
                    break;
                  case '8th':
                    echo "15:50<br>|<br>15:40";
                    break;
                  case '9th':
                    echo "16:40<br>|<br>16:30";
                    break;
                  default:
                    echo "Free";
                    break;
                }
                ?></div><div class="subject"><?php
                echo "<h3>" . $value . "</h3>";

                $subjectQuery = "SELECT coursename FROM `course` WHERE `coursecode` = ?";
                $subjectStmt = $mysqli->prepare($subjectQuery);
                $subjectStmt->bind_param("s", $value);
                $subjectStmt->execute();
                $subjectResult = $subjectStmt->get_result();
                $subject = $subjectResult->fetch_assoc();
                echo "<div class=\"subject-name\">" . $subject['coursename'] . "</div>";
                echo "</div></div>";

              }
            }
          }
          else {
            echo "<div class='holiday'> Not Scheduled </div>";
          }
        }
      }
      else{
        echo "<div class= 'holiday'>Holiday</div>";
      }
      ?>
      <!-- <div class="period">
        <div class="time">
          08:00<br>|<br>08:50
        </div>
        <div class="subject">
          <h3>BLC603</h3>
          Database Management System <br>
          Mohd Naved Qureshi 
        </div>
      </div> -->
    </div>
  </div>