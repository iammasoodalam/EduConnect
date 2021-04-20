
$(function(){
  var hamburger = $(".hamburger"),
      student = $("#student"), 
      professor = $("#professor"), 
      schedule = $("#schedule"), 
      nav = $("nav");

  hamburger.on("click", function(){
    nav.slideToggle();
    hamburger.toggleClass("nav-open");
  });
  $(".login-cta").on("click", function(){
    $(".login-option").slideToggle(300);
    $(".fa-caret-down").toggleClass("open");
  });

  toAdmin = () => {
    location.href = "./admin-login.php";
  }
  toStudent = () => {
    location.href = "./student-login.php";
  }
  toProfessor = () => {
    location.href = "./professor-login.php";
  }
  toContact = () => {
    location.href = "./contact.php";
  }
  toHome = () => {
    location.href = "./home.php";
  }
  logout = () => {
    location.href = "./includes/logout.inc.php";
  }
  toProfile = () => {
    location.href = "./profile.php";
  }
  toUpload = () => {
    location.href = "./upload.php";
  }

  //Input for Student/professor or schedule-------//////////////////////////////////////////
  $("#nav-pro").on("click", function(){
    professor.show(300);
    student.hide(300);
    schedule.hide(300);
    nav.slideUp();
    hamburger.removeClass("nav-open");
  });
  $("#nav-stu").on("click", function(){
    student.show(300);
    professor.hide(300);
    schedule.hide(300);
    nav.slideUp();
    hamburger.removeClass("nav-open");
  });
  $("#nav-schedule").on("click", function(){
    schedule.show(300);
    professor.hide(300);
    student.hide(300);
    nav.slideUp();
    hamburger.removeClass("nav-open");
  });

  //Student and Professor form input------------/////////////////////

  closeOutput = () => {
    $("#resultStudent").slideUp(300);
    $("#resultProfessor").slideUp(300);
  };

  formResult = (input, result) => {
    input.on("submit", function() {
      var that = $(this),
          url = that.attr("action"),
          type = that.attr("method"),
          data = {};
      that.find('[name]').each(function (index, value) {
        var that = $(this),
            name = that.attr('name'),
            value = that.val();
        data[name] = value;
      });
      console.log(data);
      $.ajax({
        url: url,
        type: type,
        data: data,
        success: function(response){
          result.html(response);
          result.slideDown(300);
        }
      });
      $('html, body').animate({ scrollTop: 0 }, 100);
  
      return false;
    });
  };

  formResult($("form.studentForm"), $("#resultStudent"));
  formResult($("form.professorForm"), $("#resultProfessor"));

  //Schedule insertion ----------------//////////////////////////////////
  $("#getSubjects").on("click", function(){
    var semester = $("#chooseSemester"),
        branch = $("#chooseBranch");
    var data = {
          branch: `${branch.val()}`,
          semester: `${semester.val()}`
        };
    $.ajax({
      url: "includes/getSubjects.inc.php",
      type: "POST",
      data: data,
      success: function (response) {
        $(".period-value").html(response);
      }
    })
  });

  $("form#schedule-uploader").on("submit", function () {
    var that = $(this),
        url = that.attr("action"),
        type = that.attr("method"),
        data = {};
    that.find('[name]').each(function (index, value) {
      var that = $(this),
          name = that.attr('name'),
          value = that.val();
          data[name] = value;
    });
    $.ajax({
      url: url,
      type: type,
      data: data,
      success: function(response){
        $("#schedule-result").html(response);
        $("#schedule-result").slideDown(300);
      }
    });
    $('html, body').animate({ scrollTop: 0 }, 100);
    return false;
  });

  closeScheduleOutput = () => {
    $("#schedule-result").slideUp(300);
  }
  // Contact form ----------------------////////////////////////////////////
  $("form#contact-form").on("submit", function () {
    var that = $(this),
        url = that.attr("action"),
        type = that.attr("method"),
        data = {};
    that.find('[name]').each(function (index, value) {
      var that = $(this),
          name = that.attr('name'),
          value = that.val();
          data[name] = value;
    });
    $.ajax({
      url: url,
      type: type,
      data: data,
      success: function (response) {
        $("#contact-form")[0].reset();
        console.log(response);
      }
    })
    return false;
  });
  
  // Login form --------------------------------//////////////////////////
  loginForm = (input, result, redirect) => {
    input.on("submit", function() {
      var that = $(this),
          url = that.attr("action"),
          type = that.attr("method"),
          data = {};
      that.find('[name]').each(function (index, value) {
        var that = $(this),
            name = that.attr('name'),
            value = that.val();
        data[name] = value;
      });
      $.ajax({
        url: url,
        type: type,
        data: data,
        success: function(response){
          if (response == "verified") {
            location.href = redirect;
          }
          else{
            result.html(response);
          }
        }
      });  
      return false;
    });
  };

  loginForm($("#admin-login-form"), $(".result"), "./uploader.php");
  loginForm($("#professor-login-form"), $(".result"), "./home.php");
  loginForm($("#student-login-form"), $(".result"), "./home.php");

  //HOME section ----------------////////////////////////////////////
  if($(document).width() < 768){
    var periodIndex = 1;
    // if($(".period").length == 0){
    //   $("#schedule-section").css("display", "none");
    // }
    showSlides = (n) => {
      var i,
          period = $(".period");
      if(n > period.length) {periodIndex = period.length};
      if(n < 1) {periodIndex = 1};
      for(i = 0; i < period.length; i++){
        $(period).css("display", "none");
      }
      $(period[periodIndex - 1]).css("display", "grid");
    }
    showSlides(periodIndex);
    plusSlides = (n) => {
      showSlides(periodIndex += n);
    }
  }
  $(window).on("resize", function () {
    if($(window).width() < 768){
      var periodIndex = 1;
      // if($(".period").length == 0){
      //   $("#schedule-section").css("display", "none");
      // }
      showSlides = (n) => {
        var i,
            period = $(".period");
        if(n > period.length) {periodIndex = period.length};
        if(n < 1) {periodIndex = 1};
        for(i = 0; i < period.length; i++){
          $(period).css("display", "none");
        }
        $(period[periodIndex - 1]).css("display", "grid");
      }
      showSlides(periodIndex);
      plusSlides = (n) => {
        showSlides(periodIndex += n);
      }
    }
    else{
      $(".period").css("display", "grid");
    }
  })
  // Upload -------------------- /////////
  $("#sampleeditor").on("keyup", function(){
    $("#detailInfo").val($(this).html());
  })
  $("#uploadType").on("change", function() {
    if($(this).val() === 'assignment'){
      $(".submission").show();
    } else {
      $(".submission").hide();
    }
  })
});


