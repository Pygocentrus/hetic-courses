/**
 * Manages the Slideshare API call
 * to get further information about
 * a presentation in order to embed
 * it on the single course's page
 * @param {String} url The slideshare presentation URL
 */
var SlideshareManager = function SlideshareManager(url) {
  this.source = url;
  this.apiKey = "Bpul0eKA";
  this.sharedsecret = "U20mvzXk";
  this.url = "";
};

/**
 * Grabs further data about a presentation
 * then runs the callback.
 * @param {Function} fn The callback to run afterward
 */
SlideshareManager.prototype.getSlideshareInfo = function (fn) {
  var _this = this;
  this.init();
  $.ajax({
    url: _this.url,
    method: "GET",
    dataType: 'jsonp',
    success: fn
  });
};

SlideshareManager.prototype.init = function () {
  timestr = this.getUnixTime(),
  hashstr = this.generateTimeHash(timestr),
  params = "&api_key=" + this.apiKey + "&ts=" + timestr + "&hash=" + hashstr + "&format=json",
  this.url = "http://fr.slideshare.net/api/oembed/2?url=" + this.source + params;
};

SlideshareManager.prototype.generateTimeHash = function (timestr) {
  return SHA1(this.sharedsecret + timestr);
};

SlideshareManager.prototype.getUnixTime = function () {
  return Math.round(new Date().getTime()/1000.0);
};
