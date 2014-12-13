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


/*********************HTTPREQUEST*************/
var url = $('#slideshare_url').val(),
    apiKey ="Bpul0eKA",
    sharedsecret = "U20mvzXk",
    timestr = getUnixTime(),
    hashstr = generateTimeHash(timestr),
    params = "api_key="+apiKey+"&ts="+timestr+"&hash="+hashstr+"",
    url = "http://fr.slideshare.net/api/oembed/2?url=" + url + "&format=json" + '&' + params

$.ajax({
  url: url,
  method: "GET",
  dataType: 'jsonp',
  success: function(data){
    $('#iframe-slideshare').attr('src', "//www.slideshare.net/slideshow/embed_code/" + data.slideshow_id);
  }
});


/******************************UNIXTIME*******************************/

function getUnixTime()
{
  var theDate = new Date();
  return Math.round(theDate.getTime()/1000.0);
}

/*******************************TIMEHASH*********************************/

function generateTimeHash(timestr)
{
    // form.ts.value = timestr;
    var hashstr = SHA1(sharedsecret + timestr);
    // alert('UNIX Time=[' + timestr + ']\nSecret Key=[' + ss + ']\nSHA1 Hash=[' + hashstr + ']');
    // form.hash.value = hashstr;

    return hashstr;
}
