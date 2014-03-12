// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require raphael
//= require morris
//= require jquery.runner-min
//= require jquery_ujs
//= require jquery.ui.autocomplete
//= require jquery.ui.datepicker
//= require_tree .

$(document).ready(function() {
  $('.hide').hide();

  var mainHeight = $(window).height();

  var setupClientsList = function() {
    var $el = $('.client-list');

    centerSearchBar = function() {
      mainHeight = $(window).height();
    };

    if ($el.length > 0) { centerSearchBar(); }
  };

  var setupWorkoutSession = function() {
    $('.workout-session-exercise-list .session-exercise-link').on('click', function() {
      $(this).parent().siblings().removeClass('onclick');
      $('.execution-data > div').hide();
      $($(this).data('target')).show();
      $(this).parent().addClass('onclick');
    });
  };

  var autoSaveSessionForm = function() {
    $('.workout-session-execution-form input[type=number]').focusout(function() {
      $('.session-exercise-execution-form').submit();
    });
    $('.workout-session-setting-form input[type=text]').focusout(function() {
      $('.session-setting-execution-form').submit();
    });
  };

  // Input Field Tool Tips
  var inputFieldToolTips = function() {
    $('.has-tooltip').on('focusin', function() {
      var tooltip_text = $(this).attr('title');
      $(this).after("<p class='input-field-tooltip'>" + tooltip_text + "</p>");
    });

    $('.has-tooltip').on('focusout', function() {
      $(this).next().remove('p');
    });
  };

  // Input Errors
  var inputFieldErrors = function() {
    var password = {};
    var location = {};
    $('.text-input').on('keyup', function() {
      password = $('#gym_password').val();
      location = $('#gym_location').val();

      if (location.length > 0 && password.length > 0) {
        var name = $("#gym_location").val();
        $('.submit-button input[type=submit]').removeClass('sign-in-button-inactive');
        $('.submit-button input[type=submit]').addClass('sign-in-button-active');
        // $('.submit-button input[type=submit]').val("Sign in");
        $('.welcome-back').remove();
        // $('.submit-button').append("<p class='welcome-back'>Welcome back " + name + "</p>");
      }
      else {
        $('.submit-button input[type=submit]').addClass('sign-in-button-inactive');
        $('.submit-button input[type=submit]').removeClass('sign-in-button-active');
        // $('.submit-button input[type=submit]').val("Sign in");
        $('.welcome-back').remove();
      }
    });
     $('.submit-button input[type=submit]').on('click', function(e) {
      if(location.length == 0 || password.length == 0) {
        alert("Make sure we get your location and password!");
        e.preventDefault();
      } else if(location.length == undefined || password.length == undefined) {
        alert("Make sure we get your location and password!");
        e.preventDefault();
      }
    });
  };

  var sessionTimer = function() {
    $('#stop-stop-watch').hide();
    $('#reset-stop-watch').hide();
    $('#stop-watch').runner();

    $('#start-stop-watch').click(function() {
      $('#stop-watch').runner('start');
      $('#reset-stop-watch').hide();
      $(this).hide();
      $('#stop-stop-watch').show();
    });

    $('#stop-stop-watch').click(function() {
      $('#stop-watch').runner('stop');
      $('#stop-stop-watch').hide();
      $('#reset-stop-watch').show();
      $('#start-stop-watch').show();

      var time = $('#stop-watch').text();
      if (time.length < 6)
      {
        $(".time-input").val("00:" + time);
      }
      else
      {
       $(".time-input").val(time);
      }
      $('.session-exercise-execution-form').submit();
    });

    $("#reset-stop-watch").click(function() {
      $("#stop-watch").runner("reset");

      $('#stop-stop-watch').hide();
      $('#reset-stop-watch').hide();
      $('#start-stop-watch').show();
    });
  };

  var automaticClientSearchBar = function() {
    $('.client-search-bar form input').keyup(function(){
      $(this).parent('form').submit();
    });
  };

  var clientGraph = function() {
    new Morris.Line({
      // ID of the element in which to draw the chart.
      element: 'client_chart',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: $("#client_chart").data('exercises'),
      // The name of the data record attribute that contains x-values.
      xkey: 'updated_at',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press', 'exercise'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press', 'exercise'],

      hideHover: true,
      xLabels: "day"
      // dateFormat: function (created_at) {
      //   var d = new Date(created_at);
      //   return d.getYear() + '/' + (d.getMonth() + 1) + '/' + d.getDay();
      // }
    });

    $("select").on("change", function(){
      $(this).parent('form').submit();
    });
  };

  var newSession = function() {
    $("#session_routine_id").change(function(){
      $.ajaxSetup({
        headers: { "cache-control": "no-cache" }
      });
      $.ajax({
        type: "GET",
        url: "new?routine_id=" + $(this).val() + "&client_id=" + $(this).prev('label').data("client"),
        async: true,
        cache: true,
        dataType: "script",
        success: function() {
          console.log("worked");
        },
        error: function() {
          console.log("didnt work");
        }
      });
      $('.submit-session').fadeIn(500);
    });
  };

  var createNewRoutine = function(){
    $('.create-routine-link').on("click", function(e){
      $("#session_routine_id").val("");
      $('.choose-existing ul').remove();
      $('.choose-existing').hide();
      $('.routine-input').prop('checked', false);
      $('.create-new').show();
      $('.submit-session').show();
       $('.create-routine-link').addClass('tab');
      $('.choose-existing-link').removeClass('tab');
      $("#session_routine_description").focus();
      return false;
    });
  };

  var chooseExistingRoutine =  function(){
    $('.choose-existing-link').on("click", function(e){
      $('.create-new').hide();
      $('.choose-existing').show();
      $('.create-routine-link').removeClass('tab');
      $('.choose-existing-link').addClass('tab');
      return false;
    });
  };

  var newSessionDate = function() {
    $('.h2-and-labels label').on("click", function(){
      $('.session-datepicker-text-field').val("");
      $('.datepicker-label').text("Other date");
      $('.datepicker-label').removeClass("onclick");
    });

    $('.datepicker-label').on("click", function(){
      $('.session-datepicker-text-field').show();
      $(this).addClass('onclick');
      $('.h2-and-labels input[type=radio]').prop('checked', false);
    });

    $('.session-datepicker-text-field').change(function(){
      var date = $(this).val();
      $('.datepicker-label').text(date);
      $(this).hide();
    });

    $('.new-session-date').on("change", function(){
      var d = new Date();
      var curr_date = d.getDate();
      var curr_month = d.getMonth() + 1; //Months are zero based
      if (curr_month != 10 || curr_month != 11 || curr_month != 12) {
        curr_month = "0" + curr_month
      }
      if (curr_date != 10 || curr_month != 11 || curr_month != 12) {
        curr_date = "0" + curr_date
      }
      var curr_year = d.getFullYear();
      if(curr_year + "-" + curr_month + "-" + curr_date == $(this).val()) {
        $('.submit-session input[type=submit]').val("Start Workout");
      } else {
        $('.submit-session input[type=submit]').val("Save Workout");
      }
    });
  };

  var ensureNameForRoutine = function() {
    $('.submit-session input').on("click", function(e){
      var description = $('#session_routine_description').val();
      var otherEx = $("#session_routine_id").val();

    if ($('.new-routine-exercises').children('li').find('input:checked').length == 0 && otherEx == ""){
      e.preventDefault();
      alert("You need some exercises to work out!");
      $('.session-form-checkbox-labels').addClass("not-ready");
    }

      if (otherEx == "" && description == "") {
        e.preventDefault();
        alert("You need to add a name to your routine!");
        $('.add-routine-name').show();
        $('#session_routine_description').focus();
      }

    });
  };

  var sessionExercisesHeight = function() {
    function doOnOrientationChange()
    {
      switch(window.orientation)
      {
        case -90:
        case 90:
          var landscapeHeight = $(window).height();
          // alert(landscapeHeight);
          $('.workout-session-exercise-list').css("height", landscapeHeight);
          break;
        default:
          var portraitHeight = $(window).height();
          // alert(portraitHeight);
          $('.workout-session-exercise-list').css("height", portraitHeight);
          break;
      }
    }

    window.addEventListener('orientationchange', doOnOrientationChange);

    // Initial execution if needed
    doOnOrientationChange();
  };

  // var seeMoreOrLessCal = function() {
  //   $('.cal-see-all a').on("click", function(e){
  //     e.preventDefault();
  //     var date = $(this).parent('span').data("date");
  //     $('#' + date).children('.hide').slideToggle('slow');
  //     if ($(this).text() == "See more") {
  //       $(this).text("See less");
  //     } else {
  //       $(this).text("See more");
  //     }
  //   });
  // };

  var customNewClient = function() {
    var firstName = {};
    var isReady = false;
    var gender = false;
    $('.new-client-first-name input').on("focusout", function(){
      firstName = $(this).val();
      if(firstName.length > 0){
        $('h1 .name').text(firstName).addClass('ready');
      }
    });

    $("input[type=radio]").on("change", function(){
      gender = true;
      if (isReady && gender) {
        $('.actions input[type=submit]').val("Get " + firstName + " started!");
        $('.actions input[type=submit]').addClass("ready");
      } else {
        $('.actions input[type=submit]').val("Get new client started");
        $('.actions input[type=submit]').removeClass("ready");
      }
    });

    $('.field input[type=text]').on("keyup", function(e){
      var inputs = $('.field input[type=text]');

      inputs.each(function(index, input){
      if ($(input).val().length == 0) {
        isReady = false;
      } else {
        isReady = true;
      }
      });
      if (isReady && gender) {
        $('.actions input[type=submit]').val("Get " + firstName + " started!");
        $('.actions input[type=submit]').addClass("ready");
      } else {
        $('.actions input[type=submit]').val("Get new client started");
        $('.actions input[type=submit]').removeClass("ready");
      }
    });


    $('.new-client-form form').on("submit", function(e){
      if (isReady != true || gender != true) {
        alert("Make sure we get all the information!")
        e.preventDefault();
      } else {
      }
    });
  };

  var customNewExercise = function() {
    $(".exercise-option input[type=text]").on("focusout", function(){
    var exerciseName = $(this).val();

    if(exerciseName.length > 0) {
        $(".new-exercise-header span").text(exerciseName).addClass("ready");
        $('h3 span').text(exerciseName).addClass("ready");
        $('.exercise-form-button').val("Create " + exerciseName);
        $('.category span').text(exerciseName);
      } else {
        $(".new-exercise-header span").text("new exercise").removeClass("ready");
        $('h3 span').text("this exercise").removeClass("ready");
        $('.exercise-form-button').val("Create exercise");
        $('.category span').text("this exercise");
      }
    });

    var isReady = false;
    $('.exercise-option').on("change", function(){
      if ($('.exercise input[type=checkbox]:checked').length > 0 && $('.exercise-option input[type=text]').val().length > 0 && $('.category select').val().length > 0) {
        isReady = true;
      } else {
        isReady = false;
      }
      if (isReady) {
        $('.exercise-form-button').addClass("ready");
      } else {
        $('.exercise-form-button').removeClass("ready");
      }
    });

    $('.new-exercise-page form').on("submit", function(e){
        if (isReady !== true) {
          e.preventDefault();
          alert("Make sure you tell us the name, executions, and category of the exercise!");
        }
      });
  };

  var clientSnapChat = function(){
    $(".client").on("click", function(e){
      e.preventDefault();
      $('.' + $(this).children('.client_name').data("id")).slideToggle("5000");

      if ($(this).children('span').hasClass("fa fa-chevron-down")) {
        $(this).children('span').removeClass("fa fa-chevron-down").addClass("fa fa-chevron-up");
      } else {
        $(this).children('span').removeClass("fa fa-chevron-up").addClass("fa fa-chevron-down");
      }

      });
  };

  var currentSession = function() {
    $(".current-sessions-count").on("click", function(){
    $(".current-sessions").slideToggle("5000");

      var arrow = $("span.arrow");
      if(arrow.hasClass("fa-chevron-down")) {
        arrow.removeClass("fa-chevron-down").addClass("fa-chevron-up");
      } else {
        arrow.removeClass("fa-chevron-up").addClass("fa-chevron-down");
      }
    });
  };

  var newSessionFormValidation = function() {
    var textVal = false;
    var selectVal = false;
    var checkedVal = false;
    $('.form-validator').on('keyup', function() {
      textVal = $(this).val();
      // console.log(checkedVal);
      // console.log(selectVal);
    });
    $('.choose-existing select').on('change', function() {
      selectVal = $(this).val();
      // console.log(selectVal);
    });
    $('.session-form-checkbox').on('change', function() {
      checkedVal = $('.session-form-checkbox:checked').length;
      // console.log(checkedVal);
    });

    // $('.create-routine-link').on("click", function(){
    //   isReady = false;

    //   if(isReady) {
    //     $('.submit-session input').addClass("ready");
    //   } else {
    //     $('.submit-session input').removeClass("ready");
    //   }
    // });

    $(document).change(function(){
      var isReady = false;
      // console.log(textVal);
      // console.log(checkedVal);
      // console.log(selectVal);

      if(textVal != '' || textVal) {
        textVal = true;
        console.log(textVal);
      }
      if (checkedVal > 0) {
        checkedVal = true;
        console.log(checkedVal);
      }
      if (selectVal > 1 ) {
        selectVal = true;
        console.log(selectVal);
      }

      if(textVal && checkedVal) {
        isReady = true;
      } else if (selectVal) {
        isReady = true;
      }

      if(isReady) {
        $('.submit-session input').addClass("ready");
      } else {
        $('.submit-session input').removeClass("ready");
      }
    });
  };

  var avatarUpload = function() {
    $(".avatar-input").on("change", function(){
      $('.avatar-check').fadeIn("slow");
      $('.avatar-label').text("Uploaded!");
    });
  };


  //Calling functions
  automaticClientSearchBar();
  autoSaveSessionForm();
  setupWorkoutSession();
  setupClientsList();
  inputFieldToolTips();
  sessionTimer();
  newSession();
  createNewRoutine();
  inputFieldErrors();
  chooseExistingRoutine();
  newSessionDate();
  ensureNameForRoutine();
  sessionExercisesHeight();
  customNewClient();
  customNewExercise();
  // seeMoreOrLessCal();
  clientSnapChat();
  currentSession();
  newSessionFormValidation();
  avatarUpload();
  clientGraph();
});
