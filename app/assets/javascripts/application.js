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
    $('.have-tooltip').on('focusin', function() {
      var tooltip_text = $(this).attr('title');
      $(this).after("<p class='input-field-tool-tips'>" + tooltip_text + "</p>");
    });

    $('.have-tooltip').on('focusout', function() {
      $(this).next().remove('p');
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
      ykeys: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press'],

      hideHover: true,
      // Hide hover
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
  };

  var ensureNameForRoutine = function() {
    $('.submit-session input').on("click", function(e){

      var length = $('.new-routine-exercises li input:checked');
      // alert(length.count == undefined);
      if (length.count == undefined) {
        e.preventDefault();
        alert("You need exercises to work out!");
      }

      var description = $('#session_routine_description').val();
      var otherEx = $("#session_routine_id").val();

      if (otherEx == "" && description == "") {
        e.preventDefault();
        alert("You need to add a name to your routine!");
        $('.add-routine-name').show();
        $('#session_routine_description').focus();
      }

    });
  };

  var sessionExercisesHeight = function() {
    var mainHeight = $(window).height();
    $('.workout-session-exercise-list').css("height", mainHeight);
  };

  var seeMoreOrLessCal = function() {
    $('.see-more-or-less').on("click", '.cal-see-all a', function(e){
      e.preventDefault();
      $('.cal-hidden').fadeIn("fast");
      $(this).text("See less");
      $(this).parent('span').removeClass('cal-see-all');
      $(this).parent('span').addClass('cal-see-less');
   });

    $('.see-more-or-less').on("click", '.cal-see-less a', function(e){
      $('.cal-hidden').fadeOut("fast");
      $(this).text("See all");
      $(this).parent('span').removeClass('cal-see-less');
      $(this).parent('span').addClass('cal-see-all');
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
  chooseExistingRoutine();
  newSessionDate();
  ensureNameForRoutine();
  sessionExercisesHeight();
  seeMoreOrLessCal();
  clientGraph();
});
