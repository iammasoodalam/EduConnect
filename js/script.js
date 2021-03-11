
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

  //Student form input------------///////////////////////////////////////////////////////

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
      $.ajax({
        url: url,
        type: type,
        data: data,
        success: function(response){
          result.html(response);
          result.slideDown(300);
        }
      });
      $('html, body').animate({
        scrollTop: $("#navbar").offset().top
      }, 100);
  
      return false;
    });
  };

  formResult($("form.studentForm"), $("#resultStudent"));
  formResult($("form.professorForm"), $("#resultProfessor"));

  //Schedule insertion ----------------////////////////////////////////////////
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
    console.log(data);
    // $.ajax({
    //   url: url,
    //   type: type,
    //   data: data,
    //   success: function(response){
        
    //   }
    // });
    return false;
  });

});


