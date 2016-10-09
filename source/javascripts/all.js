//= require jquery/dist/jquery.min
//= require jquery.mb.ytplayer/dist/jquery.mb.YTPlayer
//= require bootstrap
//= require owl.carousel/dist/owl.carousel.min
//= require magnific-popup/dist/jquery.magnific-popup.min

//= require 'app'

$(document).ready(function() {
  $('.player').mb_YTPlayer();

  $('.owl-carousel').owlCarousel({
    items: 3,
    margin: 15,
    dots: true
  });

  $('.owl-carousel').magnificPopup({
    delegate: 'a',
    type: 'image',
    gallery:{
      enabled: true
    }
  });
});
