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
//= require jquery_ujs
//= require jquery.ui.autocomplete
//= require jquery.ui.datepicker
//= require_tree .

$(document).ready(function() {
  $('.hide').hide()

  var setupClientsList = function(){
    var $el = $('.client-list');

    centerSearchBar = function() {
      mainHeight = $(window).height();
    }

    if ($el.length > 0) { centerSearchBar(); }
  };

  var setupWorkoutSession = function(){
    $('.workout-session-exercise-list .session-exercise-link').on('click', function() {
      $(this).parent().siblings().removeClass('onclick');
      $('.execution-data > div').hide();
      $($(this).data('target')).show();
      $(this).parent().addClass('onclick');
    });
  };

  var autoSaveSessionForm = function(){
    $('.workout-session-execution-form input[type=text]').focusout(function(){
      $('.session-exercise-execution-form').submit();
    });
  };

  // Input Field Tool Tips

  autoSaveSessionForm();
  setupWorkoutSession();
  setupClientsList();
});
