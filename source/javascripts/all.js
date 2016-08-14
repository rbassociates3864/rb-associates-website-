//= require jquery/dist/jquery.min
//= require bootstrap

//= require 'app'

$(document).ready(function() {
  $('#toggle').click(function() {
     $(this).toggleClass('active');
     $('#overlay').toggleClass('open');
    });
});
