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
//= foundation.min
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
    $('.workout-session-execution-form input[type=text]').focusout(function() {
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

  //Calling functions
  automaticClientSearchBar();
  autoSaveSessionForm();
  setupWorkoutSession();
  setupClientsList();
  inputFieldToolTips();
  sessionTimer();
});
