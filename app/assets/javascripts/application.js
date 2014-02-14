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
    // new Morris.Line({
    //   // ID of the element in which to draw the chart.
    //   element: 'client_chart',
    //   // Chart data records -- each entry in this array corresponds to a point on
    //   // the chart.
    //   data: $("#client_chart").data('exercises'),
    //   // The name of the data record attribute that contains x-values.
    //   xkey: 'updated_at',
    //   // A list of names of data record attributes that contain y-values.
    //   ykeys: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press'],
    //   // Labels for the ykeys -- will be displayed when you hover over the
    //   // chart.
    //   labels: ['triceps', 'biceps', 'overhead_press', 'leg_curl', 'leg_press', 'abs', 'rotations', 'adduction', 'power_tower_abs', 'ab_core', 'precore_pullover', 'narrow_grip_pulldown', 'arm_cross', 'leg_extension', 'neck_extension', 'lower_back', 'rowing_torso', 'abduction', 'power_tower_leg_press'],
    //   // Hide hover
    // });
      new Morris.Line({
        element: 'line-example',
        data: [
          { y: '2006', a: 100, b: 90 },
          { y: '2007', a: 75,  b: 65 },
          { y: '2008', a: 50,  b: 40 },
          { y: '2009', a: 75,  b: 65 },
          { y: '2010', a: 50,  b: 40 },
          { y: '2011', a: 75,  b: 65 },
          { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B']
      });
  };

  var newSession = function() {
    $(".label-routine").click(function(){
      $('.submit-session').show();
      $.ajax({
        type: "GET",
        url: "http://localhost:3000/sessions/new?routine_id=" + $(this).data("id") + "&client_id=" + $(this).data("client"),
        dataType: "script"
      });
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
  clientGraph();
});
