<?php 
include "./includes/header.inc.php";
if($_SESSION['userType'] != 'admin'){
  header("Location: ./home.php");
}
?>

<main class="uploader active" id="student">
  <div class="form-instruction">
    <div class="result-input" id="resultStudent" style="display: none;">
    <!-- Output of new Student will appear here -->
    </div>
    <h2>Instruction for Students form</h2>
    <ul class="instruction-list">
      <li><strong>Enrollment</strong> number should be unique and have a format like (AB9876), 2 letters and 4 digits.</li>
      <li><strong>Faculty</strong> number will depend on the enrollment year of the student and current branch of study and roll number and format will be (21DPCE169), 2 digits for year, 4 letters for branch and 3 digits for roll number</li>
      <li><strong>Student name</strong> can only hold letters a-z and A-Z and length should be below 30</li>
      <li><strong>Father's name</strong> should only the name of student no prifixes are allowed like Mr., Prof., Dr., Lt., Gen. etc.</li>
      <li><strong>Email-id:</strong> It will be better if user mail id will be institutional mail id which is given by AMU.</li>
      <li><strong>Address:</strong> Enter the permanent address of the student here.</li>
    </ul>
  </div>
  <div class="form">
    <h2>Student form</h2>
    <form action="includes/newStudent.php" method="POST" class="studentForm">
      <input type="reset" value="Reset Form">
      <label for="enrollment">Enrollment number</label>
      <input type="text" name="enrollment" id="enrollment" placeholder="AB1234" required>
      <label for="faculty">Faculty number</label>
      <input type="text" name="faculty" id="faculty" placeholder="21ABCD123" required>
      <label for="studentName">Student's name</label>
      <input type="text" name="studentName" id="studentName" placeholder="Name" required>
      <label for="fathersName">Father's name</label>
      <input type="text" name="fathersName" id="fathersName" placeholder="Father's Name" required>
      <label for="studEmailId">Email</label>
      <input type="email" name="studEmailId" id="studEmailId" placeholder="johndoe@example.com" required>
      <label for="studPhone">Phone number</label>
      <input type="text" name="studPhone" id="studPhone" placeholder="+919876543210" required>
      <label for="dateOfBirth">Date of Birth</label>
      <input type="date" name="dateOfBirth" id="dateOfBirth" required>
      <label for="studPassword">Password</label>
      <input type="password" name="studPassword" id="studPassword" placeholder="********" required>
      <label for="studJoinDate">Join date</label>
      <input type="date" name="studJoinDate" id="studJoinDate" placeholder="DD-MM-YYYY" required>
      <label for="branch">Branch</label>
      <select name="branch" id="branch">
        <option value="">Select Option</option>
        <option value="1">Architechtural Assistantship</option>
        <option value="2">Interior Design</option>
        <option value="3">Civil Engineering</option>
        <option value="4">Advanced Dip. In Food Technology</option>
        <option value="5">Computer Engineering</option>
        <option value="6">Electronics Engineering</option>
        <option value="7">Electrical Engineering</option>
        <option value="8">Instrumentation & control</option>
        <option value="9">Leather & Footwear Technology</option>
        <option value="10">Machenical Engineering</option>
      </select>
      <label for="semester">Semester</label>
      <select name="semester" id="semester">
        <option value="">Select Semester</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
      </select>
      <label for="studAddress">Address</label>
      <textarea name="studAddress" id="studAddress" cols="30" rows="5" placeholder="12/3 personal building, unnamed road, heaven" required></textarea>
      <input type="submit" value="Upload">
    </form>
  </div>
</main>
<main class="uploader" id="professor" style="display: none;">
  <div class="form-instruction">
    <div class="result-input" id="resultProfessor">

    </div>
    <h2>Instruction for Professor form</h2>
    <ul class="instruction-list">
      <li><strong>Professor ID</strong> should be 8 digit number.</li>
      <li><strong>Professor name</strong> can only hold letters a-z and A-Z and length should be below 30</li>
      <li><strong>Professor Qualification</strong> can only hold the highest degree of qualification he/she have.</li>
      <li><strong>Email-id:</strong> It will be better if user mail id will be institutional mail id which is given by AMU.</li>
      <li><strong>Address:</strong> Enter the permanent address of the student here.</li>
    </ul>
  </div>
  <div class="form">
    <h2>Professor form</h2>
    <form action="includes/newProfessor.php" method="POST" class="professorForm" >
      <label for="professorId">Professor ID</label>
      <input type="text" name="professorId" id="professorId">
      <label for="professorName">Professor's name</label>
      <input type="text" name="professorName" id="professorName">
      <label for="qualification">Professor Qualification</label>
      <input type="text" name="qualification" id="qualification">
      <label for="profEmailId">Email</label>
      <input type="email" name="profEmailId" id="profEmailId">
      <label for="profPhone">Phone number</label>
      <input type="text" name="profPhone" id="profPhone">
      <label for="profPassword">Password</label>
      <input type="password" name="profPassword" id="profPassword">
      <label for="profJoinDate">Join date</label>
      <input type="date" name="profJoinDate" id="profJoinDate">
      <label for="profAddress">Address</label>
      <textarea name="profAddress" id="profAddress" cols="30" rows="10"></textarea>
      <input type="submit" value="Upload">
    </form>
  </div>
</main>
<main id="schedule" class="" style="display: none;">
  <div id="schedule-result" style="display: none;">
    
  </div>
  <h2 id="schedule-heading">Schedule uploader for student</h2>
  <ul class="schedule-instruction">
    <li>First choose the branch in which you want to upload the time-table.</li>
    <li>Then choose option from semester dropdown, and click on 'Get Subjects' button. </li>
    <li>It will load all the subjects which is available for that branch and semester.</li>
    <li>Then fill all the fields which should a value. If any field will left then it will be set to Empty.</li>
    <li>Now if time table is uploading for the first time then, Choose 'insert' option, otherwise choose update</li>
    <li>And finally click on Upload button.</li>
  </ul>
  <form action="includes/schedule.inc.php" method="post" class="form" id="schedule-uploader">
    <div class="upload-for">
      <label for="upload-for">Upload Schedule for:</label>
      <select name="upload-for" id="upload-for">
        <option value="student">Student</option>
        <option value="professor">Professor</option>
      </select>
      <div class="even-odd" style="display: none;">
        <label for="proschedule">Professor Id</label>
        <select name="proschedule" id="proschedule">
          <option value="">Select professor</option>
        </select>
        <label for="even-odd">Semester</label>
        <select name="even-odd" id="even-odd">
          <option value="">Select Semester</option>
          <option value="1">Odd Semester</option>
          <option value="0">Even Semester</option>
        </select>
      </div>
    </div>
    <div id="branch-semester">
      <div class="branch" class="branch-semester">
        <label for="chooseBranch">Branch</label>
        <select name="branch" id="chooseBranch">
          <option value="">Select Branch</option>
          <option value="1">Architechtural Assistantship</option>
          <option value="2">Interior Design</option>
          <option value="3">Civil Engineering</option>
          <option value="4">Advanced Dip. In Food Technology</option>
          <option value="5">Computer Engineering</option>
          <option value="6">Electronics Engineering</option>
          <option value="7">Electrical Engineering</option>
          <option value="8">Instrumentation & control</option>
          <option value="9">Leather & Footwear Technology</option>
          <option value="10">Machenical Engineering</option>
        </select>
      </div>
      <div class="semester" class="branch-semester">
        <label for="chooseSemester">Semester</label>
        <select name="semester" id="chooseSemester">
          <option value="">Select Semester</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
        </select>
      </div>
      <input type="button" value="Get Subjects" id="getSubjects">
      <!-- <div id="getSubjects">Get Subjects</div> -->
    </div>
    <div class="time-table">
      <div class="day" id="periods">
        <h2></h2>
        <div class="periods">I</div>
        <div class="periods">II</div>
        <div class="periods">III</div>
        <div class="periods">IV</div>
        <div class="periods">V</div>
        <div class="periods">VI</div>
        <div class="periods">VII</div>
        <div class="periods">VIII</div>
        <div class="periods">IX</div>
      </div>
      <div class="day" id="monday">
        <h2>Monday</h2>
        <label for="monday-period1">I Period</label>
        <select name="monday-period1" id="monday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-monday-period2">II Period</label>
        <select name="monday-period2" id="monday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period3">III Period</label>
        <select name="monday-period3" id="monday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period4">IV Period</label>
        <select name="monday-period4" id="monday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period5">V Period</label>
        <select name="monday-period5" id="monday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period6">VI Period</label>
        <select name="monday-period6" id="monday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period7">VII Period</label>
        <select name="monday-period7" id="monday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period8">VIII Period</label>
        <select name="monday-period8" id="monday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="monday-period9">IX Period</label>
        <select name="monday-period9" id="monday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
      <div class="day" id="tuesday">
        <h2>Tuesday</h2>
        <label for="tuesday-period1">I Period</label>
        <select name="tuesday-period1" id="tuesday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-tuesday-period2">II Period</label>
        <select name="tuesday-period2" id="tuesday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period3">III Period</label>
        <select name="tuesday-period3" id="tuesday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period4">IV Period</label>
        <select name="tuesday-period4" id="tuesday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period5">V Period</label>
        <select name="tuesday-period5" id="tuesday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period6">VI Period</label>
        <select name="tuesday-period6" id="tuesday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period7">VII Period</label>
        <select name="tuesday-period7" id="tuesday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period8">VIII Period</label>
        <select name="tuesday-period8" id="tuesday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="tuesday-period9">IX Period</label>
        <select name="tuesday-period9" id="tuesday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
      <div class="day" id="wednesday">
        <h2>Wednesday</h2>
        <label for="wednesday-period1">I Period</label>
        <select name="wednesday-period1" id="wednesday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-wednesday-period2">II Period</label>
        <select name="wednesday-period2" id="wednesday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period3">III Period</label>
        <select name="wednesday-period3" id="wednesday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period4">IV Period</label>
        <select name="wednesday-period4" id="wednesday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period5">V Period</label>
        <select name="wednesday-period5" id="wednesday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period6">VI Period</label>
        <select name="wednesday-period6" id="wednesday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period7">VII Period</label>
        <select name="wednesday-period7" id="wednesday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period8">VIII Period</label>
        <select name="wednesday-period8" id="wednesday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="wednesday-period9">IX Period</label>
        <select name="wednesday-period9" id="wednesday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
      <div class="day" id="thursday">
        <h2>Thursday</h2>
        <label for="thursday-period1">I Period</label>
        <select name="thursday-period1" id="thursday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-thursday-period2">II Period</label>
        <select name="thursday-period2" id="thursday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period3">III Period</label>
        <select name="thursday-period3" id="thursday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period4">IV Period</label>
        <select name="thursday-period4" id="thursday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period5">V Period</label>
        <select name="thursday-period5" id="thursday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period6">VI Period</label>
        <select name="thursday-period6" id="thursday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period7">VII Period</label>
        <select name="thursday-period7" id="thursday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period8">VIII Period</label>
        <select name="thursday-period8" id="thursday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="thursday-period9">IX Period</label>
        <select name="thursday-period9" id="thursday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
      <div class="day" id="friday">
        <h2>Friday</h2>
        <label for="friday-period1">I Period</label>
        <select name="friday-period1" id="friday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-friday-period2">II Period</label>
        <select name="friday-period2" id="friday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period3">III Period</label>
        <select name="friday-period3" id="friday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period4">IV Period</label>
        <select name="friday-period4" id="friday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period5">V Period</label>
        <select name="friday-period5" id="friday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period6">VI Period</label>
        <select name="friday-period6" id="friday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period7">VII Period</label>
        <select name="friday-period7" id="friday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period8">VIII Period</label>
        <select name="friday-period8" id="friday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="friday-period9">IX Period</label>
        <select name="friday-period9" id="friday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
      <div class="day" id="saturday">
        <h2>Saturday</h2>
        <label for="saturday-period1">I Period</label>
        <select name="saturday-period1" id="saturday-period1" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-saturday-period2">II Period</label>
        <select name="saturday-period2" id="saturday-period2" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period3">III Period</label>
        <select name="saturday-period3" id="saturday-period3" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period4">IV Period</label>
        <select name="saturday-period4" id="saturday-period4" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period5">V Period</label>
        <select name="saturday-period5" id="saturday-period5" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period6">VI Period</label>
        <select name="saturday-period6" id="saturday-period6" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period7">VII Period</label>
        <select name="saturday-period7" id="saturday-period7" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period8">VIII Period</label>
        <select name="saturday-period8" id="saturday-period8" class="period-value">
          <option value="">------------</option>
        </select>
        <label for="saturday-period9">IX Period</label>
        <select name="saturday-period9" id="saturday-period9" class="period-value">
          <option value="">------------</option>
        </select>
      </div>
    </div>
    <div class="upload-type">
      <select name="upload-type" id="upload-type">
        <option value="">Select Upload Type</option>
        <option value="insert">Insert</option>
        <option value="update">Update</option>
      </select>
      <input type="submit" value="Upload">
    </div>
  </form>
</main>
<?php include "includes/footer.inc.php"; ?>