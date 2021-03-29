
  <?php
  require "./includes/header.inc.php";
  ?>
  <main class="homepage">
    <div class="circle">
      <h1>Welcome to EduConnect</h1>
      <p>In the educationally progressive world we are building an integrated learning platform by bringing the educational ecosphere under an umbrella.</p>
    </div>
    <div class="contents">
      <div class="timetable"><!--Time table Section-->
        <h2>Time Table</h2>
        <div class="period">
          <div class="duration">
            08:00<br>|<br>08:50
          </div>
          <div class="subject-class">
            <h3 class="subject-code">BLC-603</h3>
            <p class="subject-teacher">Mohd Naved Qureshi</p>
            <p class="subject-name">Database Management System</p>
          </div>
        </div>
        <!-- <div class="period">
          <div class="duration">
            08:00<br>|<br>08:50
          </div>
          <div class="subject-class">
            <h3 class="subject-code">BLC-602</h3>
            <p class="subject-teacher">Mohd Naved Qureshi</p>
            <p class="subject-name">Database Management System</p>
          </div>
        </div>
        <div class="period">
          <div class="duration">
            08:00<br>|<br>08:50
          </div>
          <div class="subject-class">
            <h3 class="subject-code">BLC-601</h3>
            <p class="subject-teacher">Mohd Naved Qureshi</p>
            <p class="subject-name">Database Management System</p>
          </div>
        </div> -->
      </div>
      <div class="assignment"> <!--Assignment Section-->
        <h2>Assignments</h2>
        <div class="topbar">
          BLC-603 <span>Due date: 21-02-2021</span>
        </div>
        <div class="details">
          <h3>Assignment - I First Unit</h3>
          <p>> Read the given questions in pdf file and write answer on A4 size paper and upload the pdf file of photos in website.</p>
          <div class="fileupload">Questions.pdf <span>&times;</span></div>
          <div class="add-file">&plus;</div>
          <button type="submit">Upload</button>
        </div>
      </div>
      <div class="lecture-notes"><!--Lecture Notes section-->
        <h2>Lecture Notes</h2>
        <div class="topbar">
          BLC-603 <span>Uploaded On: 02-02-2021</span>
        </div>
        <div class="details">
          <h3>Notes - First Unit</h3>
          <p>> The file provided below contains notes for the unit first, read it carefully so, it will help in lectures to understand.</p>
          <div class="attachement">Introduction to DBMS.pdf <span><i class="fas fa-download"></i></span></div>
        </div>
      </div>
      <div class="search-student"><!--Student search Section-->
        <h2>Search Student</h2>
        <form action="" onsubmit="return false;">
          <input type="text" name="student-id" id="student-id" placeholder="Enrollment OR Faculty Number"><br>
          <input type="submit" value="Search">
        </form>
      </div>
    </div>
  </main>
  <?php include "includes/footer.inc.php"; ?>