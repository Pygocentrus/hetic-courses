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

/***********AUTOCOMPLETE**********************/
$(function() {
  var availableTags = [
  "ActionScript",
  "AppleScript",
  "Asp",
  "BASIC",
  "C",
  "C++",
  "Clojure",
  "COBOL",
  "ColdFusion",
  "Erlang",
  "Fortran",
  "Groovy",
  "Haskell",
  "Java",
  "JavaScript",
  "Lisp",
  "Perl",
  "PHP",
  "Python",
  "Ruby",
  "Scala",
  "Scheme"
  ];
  $( "#tags" ).autocomplete({
    source: availableTags
  });
});


/*********************HTTPREQUEST*************/

var xmlhttp = new XMLHttpRequest();
var href = window.location.href;
// console.log(href);
// var url = href+".json";
var url = "http://fr.slideshare.net/api/oembed/2?url=http://fr.slideshare.net/haraldf/business-quotes-for-2011&format=json&apiKey=Bpul0eKA&apiSecret=U20mvzXk";
// console.log(url);

xmlhttp.onreadystatechange = function() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    var myArr = JSON.parse(xmlhttp.responseText);
    myFunction(myArr);
  }
}
xmlhttp.open("GET", url, true);
xmlhttp.send();

function myFunction(arr) {
  console.log(arr);
  // var linkSlide=arr[0];
  // console.log(linkSlide);

}
