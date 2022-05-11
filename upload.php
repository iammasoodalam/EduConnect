<?php include "includes/header.inc.php";
if (empty($_SESSION)) {
  header("Location: index.php");
  exit();
}
if ($_SESSION['userType'] == "admin" || $_SESSION['userType'] == 'student') {
  header("Location: index.php");
}
?>

<main id="upload">
  <?php include "./includes/schedule-section.inc.php"; ?>
  <div id="upload-form">
    <h2>Upload Form</h2>
    <?php
    if (isset($_GET['error'])) {
      if ($_GET['error'] == 'emptyFields') {
    ?>
        <div class="error">All fields are mandatory, except detail info and file upload. <span onclick="closeError()">&times;</span></div>
      <?php
      } else if ($_GET['error'] == 'emptySubmissionDate') {
      ?>
        <div class="error">Last submission date should be there. <span onclick="closeError()">&times;</span></div>
      <?php
      }
    } else if (isset($_GET['success'])) {
      if ($_GET['success'] == 'assignmentUpload') {
      ?>
        <div class="success">Assignment is successfully Posted <span onclick="closeSuccess()">&times;</span></div>
      <?php
      } else {
      ?>
        <div class="success">Lecture notes are successfully uploaded <span onclick="closeSuccess()">&times;</span></div>
    <?php
      }
    }
    ?>
    <form action="./includes/upload.inc.php" id="notesUploadForm" method="POST" enctype="multipart/form-data">

      <label for="uploadType">Upload Type</label>
      <select name="uploadType" id="uploadType">
        <option value="">Select upload type</option>
        <option value="notes">Lecture Notes</option>
        <option value="assignment">Assignment</option>
      </select>

      <label for="branch">Branch</label>
      <select name="branch" id="branch">
        <option value="">Select branch</option>
        <option value="1">Architectural Assistantship</option>
        <option value="2">Interior Design</option>
        <option value="3">Civil Engineering</option>
        <option value="4">Advanced Diploma in Food Technology</option>
        <option value="5">Computer Engineering</option>
        <option value="6">Electronics Engineering</option>
        <option value="7">Electrical Engineering</option>
        <option value="8">Instrumentation Control</option>
        <option value="9">Leather and footwear technology</option>
        <option value="10">Mechanical Engineering</option>
      </select>

      <label for="semester">Semester</label>
      <select name="semester" id="semester">
        <option value="">Select semester</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
      </select>

      <label for="course">Course</label>
      <select name="course" id="course">
        <option value="">Select course</option>
      </select>

      <div class="submission" style="display: none;">
        <label for="submission">Submission Date</label>
        <input type="date" name="submission" id="submission">
      </div>

      <label for="title">Title</label>
      <input type="text" name="title" id="title">

      <div class="sample-toolbar">
        <a href="javascript:void(0)" onclick="format('bold')"><span class="fa fa-bold fa-fw"></span></a>
        <a href="javascript:void(0)" onclick="format('italic')"><span class="fa fa-italic fa-fw"></span></a>
        <a href="javascript:void(0)" onclick="format('insertunorderedlist')"><span class="fa fa-list fa-fw"></span></a>
        <a href="javascript:void(0)" onclick="setUrl()"><span class="fa fa-link fa-fw"></span></a>
        <span><input id="txtFormatUrl" placeholder="url" class="form-control"></span>
      </div>
      <div class="editor" id="sampleeditor"></div>
      <textarea name="detailInfo" id="detailInfo" cols="30" rows="10" style="display: none;"></textarea>
      <input type="file" name="attachment" id="attachment">
      <input type="submit" name="submit" value="Upload">
    </form>
  </div>
</main>

<script>
  window.addEventListener('load', function() {
    document.getElementById('sampleeditor').setAttribute('contenteditable', 'true');
  });

  function format(command, value) {
    document.execCommand(command, false, value);
  }

  function setUrl() {
    var url = document.getElementById('txtFormatUrl').value;
    var sText = document.getSelection();
    document.execCommand('insertHTML', false, `<a href="${url}" target="_blank">${sText}</a>`);
    document.getElementById('txtFormatUrl').value = '';
  }

  function getSubjects(variable) {
    $(variable).on("change", function() {
      var data = {
        "branch": $("#branch").val(),
        "semester": $("#semester").val()
      };
      $.ajax({
        url: "./includes/getSubjects.inc.php",
        type: "POST",
        data: data,
        success: function(response) {
          $("#course").html(response);
        }
      })
    })
  }
  getSubjects($("#branch"));
  getSubjects($("#semester"));

  function closeError() {
    $(".error").slideUp();
  }

  function closeSuccess() {
    $(".success").slideUp();
  }
</script>
<?php include "includes/footer.inc.php"; ?>