do ->
  'use strict'

  angular
    .module('app', ['uiGmapgoogle-maps'])
    .config(['uiGmapGoogleMapApiProvider', (uiGmapGoogleMapApiProvider) ->
      key: 'AIzaSyCAR2oIlybRzb1TK5NQCMXFfQD57p2bODI'
      v: '3.20'
      libraries: 'weather,geometry,visualization'
    ])

  $(document).ready ->

    # Background Videos
    $('.player').mb_YTPlayer()

    # Property Photo Gallery
    $('.owl-carousel').owlCarousel({
      items: 3
      margin: 15
      dots: true
    })

    $('.owl-carousel').magnificPopup({
      delegate: 'a',
      type: 'image',
      gallery:{
        enabled: true
      }
    })

    # Nav Toggle
    $('.mobile-nav-toggle').click ->
      $(this).toggleClass('open')
      $('.mobile-header').toggleClass('open animated fadeInRight')
