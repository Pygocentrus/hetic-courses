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
//= require bootstrap
//= require jquery-tagging
//= require webtoolkitsha1
//= require slideshare

if (window.location.pathname.match(/^\/cours\//) !== null) {
  var url = $('#iframe-slideshare').attr('data-slideshare-url'),
      slideshare = new SlideshareManager(url);
  slideshare.getSlideshareInfo(function (data) {
    $('#iframe-slideshare').attr('src', "//www.slideshare.net/slideshow/embed_code/" + data.slideshow_id);
  });
}

/***********AUTOCOMPLETE**********************/
// $(function() {
//   var availableTags = [
//   "ActionScript",
//   "AppleScript",
//   "Asp",
//   "BASIC",
//   "C",
//   "C++",
//   "Clojure",
//   "COBOL",
//   "ColdFusion",
//   "Erlang",
//   "Fortran",
//   "Groovy",
//   "Haskell",
//   "Java",
//   "JavaScript",
//   "Lisp",
//   "Perl",
//   "PHP",
//   "Python",
//   "Ruby",
//   "Scala",
//   "Scheme"
//   ];
//   $( "#tags" ).autocomplete({
//     source: availableTags
//   });
// });
