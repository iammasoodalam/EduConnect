$(function () {
  var hamburger = $(".hamburger"),
    student = $("#student"),
    professor = $("#professor"),
    schedule = $("#schedule"),
    nav = $("nav"),
    overlay = document.querySelector(".overlay");

  hamburger.on("click", function () {
    nav.slideToggle();
    hamburger.toggleClass("nav-open");

    if (hamburger.hasClass("nav-open")) {
      overlay.style.visibility = "visible";
      overlay.style.opacity = 1;
    } else {
      overlay.style.visibility = "hidden";
      overlay.style.opacity = 0;
    }
  });
  $(".login-cta").on("click", function () {
    $(".login-option").slideToggle(300);
    $(".fa-caret-down").toggleClass("open");
  });
  window.addEventListener("scroll", () => {
    nav.slideUp(150);
    hamburger.removeClass("nav-open");
    $(".login-option").slideUp();
    $(".fa-caret-down").removeClass("open");
    overlay.style.visibility = "hidden";
    overlay.style.opacity = 0;
  });
  $("main").on("click", () => {
    nav.slideUp();
    hamburger.removeClass("nav-open");
    $(".login-option").slideUp();
    $(".fa-caret-down").removeClass("open");
    overlay.style.visibility = "hidden";
    overlay.style.opacity = 0;
  });

  toAdmin = () => {
    location.href = "./admin-login.php";
  };
  toStudent = () => {
    location.href = "./student-login.php";
  };
  toProfessor = () => {
    location.href = "./professor-login.php";
  };
  toContact = () => {
    location.href = "./contact.php";
  };
  toHome = () => {
    location.href = "./home.php";
  };
  toAssignment = () => {
    location.href = "./assignment.php";
  };
  toLectureNotes = () => {
    location.href = "./lecture.php";
  };
  logout = () => {
    location.href = "./includes/logout.inc.php";
  };
  toProfile = () => {
    location.href = "./profile.php";
  };
  toUpload = () => {
    location.href = "./upload.php";
  };
  toSearch = () => {
    location.href = "./search.php";
  };
  toAbout = () => {
    location.href = "./about.php";
  };

  //Input for Student/professor or schedule-------//////////////////////////////////////////
  $("#nav-pro").on("click", function () {
    professor.show(300);
    student.hide(300);
    schedule.hide(300);
    nav.slideUp();
    hamburger.removeClass("nav-open");
  });
  $("#nav-stu").on("click", function () {
    student.show(300);
    professor.hide(300);
    schedule.hide(300);
    nav.slideUp();
    hamburger.removeClass("nav-open");
  });
  $("#nav-schedule").on("click", function () {
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
    input.on("submit", function () {
      var that = $(this),
        url = that.attr("action"),
        type = that.attr("method"),
        data = {};
      that.find("[name]").each(function (index, value) {
        var that = $(this),
          name = that.attr("name"),
          value = that.val();
        data[name] = value;
      });
      console.log(data);
      $.ajax({
        url: url,
        type: type,
        data: data,
        success: function (response) {
          result.html(response);
          result.slideDown(300);
        },
      });
      $("html, body").animate({ scrollTop: 0 }, 100);

      return false;
    });
  };

  formResult($("form.studentForm"), $("#resultStudent"));
  formResult($("form.professorForm"), $("#resultProfessor"));

  //Schedule insertion ----------------//////////////////////////////////
  $("#upload-for").on("change", function () {
    if ($("#upload-for").val() == "student") {
      $("#branch-semester").show(100);
      $(".even-odd").hide(100);
    } else {
      $("#branch-semester").hide(100);
      $(".even-odd").show(100);
      $.ajax({
        url: "includes/getProfessor.inc.php",
        type: "POST",
        success: function (response) {
          $("#proschedule").html(response);
        },
      });
    }
  });
  $("#getSubjects").on("click", function () {
    var semester = $("#chooseSemester"),
      branch = $("#chooseBranch");
    var data = {
      branch: `${branch.val()}`,
      semester: `${semester.val()}`,
    };
    $.ajax({
      url: "includes/getSubjects.inc.php",
      type: "POST",
      data: data,
      success: function (response) {
        $(".period-value").html(response);
      },
    });
  });
  $("#even-odd").on("change", function () {
    var data = {};
    data["even-odd"] = $(this).val();
    $.ajax({
      method: "POST",
      url: "includes/getSubjectsPro.inc.php",
      data: data,
      success: (response) => {
        $(".period-value").html(response);
      },
    });
  });

  $("form#schedule-uploader").on("submit", function () {
    var that = $(this),
      url = that.attr("action"),
      type = that.attr("method"),
      data = {};
    that.find("[name]").each(function (index, value) {
      var that = $(this),
        name = that.attr("name"),
        value = that.val();
      data[name] = value;
    });
    $.ajax({
      url: url,
      type: type,
      data: data,
      success: function (response) {
        $("#schedule-result").html(response);
        $("#schedule-result").slideDown(300);
        console.log(response);
      },
    });
    $("html, body").animate({ scrollTop: 0 }, 100);
    return false;
  });

  closeScheduleOutput = () => {
    $("#schedule-result").slideUp(300);
  };

  // Login form --------------------------------//////////////////////////
  loginForm = (input, result, redirect) => {
    input.on("submit", function () {
      var that = $(this),
        url = that.attr("action"),
        type = that.attr("method"),
        data = {};
      that.find("[name]").each(function (index, value) {
        var that = $(this),
          name = that.attr("name"),
          value = that.val();
        data[name] = value;
      });
      $.ajax({
        url: url,
        type: type,
        data: data,
        success: function (response) {
          if (response == "verified") {
            location.href = redirect;
          } else {
            result.html(response);
          }
        },
      });
      return false;
    });
  };

  loginForm($("#admin-login-form"), $(".result"), "./uploader.php");
  loginForm($("#professor-login-form"), $(".result"), "./home.php");
  loginForm($("#student-login-form"), $(".result"), "./home.php");

  //HOME section ----------------////////////////////////////////////
  if ($(document).width() < 768) {
    var periodIndex = 1;
    // if($(".period").length == 0){
    //   $("#schedule-section").css("display", "none");
    // }
    showSlides = (n) => {
      var i,
        period = $(".period");
      if (n > period.length) {
        periodIndex = period.length;
      }
      if (n < 1) {
        periodIndex = 1;
      }
      for (i = 0; i < period.length; i++) {
        $(period).css("display", "none");
      }
      $(period[periodIndex - 1]).css("display", "grid");
    };
    showSlides(periodIndex);
    plusSlides = (n) => {
      showSlides((periodIndex += n));
    };
  }
  $(window).on("resize", function () {
    if ($(window).width() < 768) {
      var periodIndex = 1;
      // if($(".period").length == 0){
      //   $("#schedule-section").css("display", "none");
      // }
      showSlides = (n) => {
        var i,
          period = $(".period");
        if (n > period.length) {
          periodIndex = period.length;
        }
        if (n < 1) {
          periodIndex = 1;
        }
        for (i = 0; i < period.length; i++) {
          $(period).css("display", "none");
        }
        $(period[periodIndex - 1]).css("display", "grid");
      };
      showSlides(periodIndex);
      plusSlides = (n) => {
        showSlides((periodIndex += n));
      };
    } else {
      $(".period").css("display", "grid");
    }
  });
  $(".read-more").on("click", function () {
    var cardData = this.previousElementSibling;
    if ($(cardData).height() == 72) {
      $(cardData).height("auto");
      $(this).html("Collapse <i class='fas fa-caret-up'>");
    } else {
      $(cardData).height(72);
      $(this).html('Read More <i class="fas fa-caret-down">');
    }
  });
  $(".card")
    .has(".submission")
    .css({ background: "#46525fb9", color: "white" });
  // Upload -------------------- /////////
  $("#sampleeditor").on("keyup", function () {
    $("#detailInfo").val($(this).html());
  });
  $("#uploadType").on("change", function () {
    if ($(this).val() === "assignment") {
      $(".submission").show();
    } else {
      $(".submission").hide();
    }
  });
  // Search -------------------- /////////
  $("#searchInput").on("keyup", function () {
    var data = {},
      searchBy = document.documentElement.contains(
        document.getElementById("searchBy")
      );
    if (searchBy) {
      data["searchBy"] = $("#searchBy").val();
    }
    data["searchInput"] = $("#searchInput").val();
    $.ajax({
      url: "./includes/search.inc.php",
      type: "GET",
      data: data,
      success: function (response) {
        $("#searchResult").html(response);
      },
    });
  });
});
