if (window.location.pathname.match(/^\/cours\//) !== null) {
  var url = $('#iframe-slideshare').attr('data-slideshare-url'),
      slideshare = new SlideshareManager(url);
  slideshare.getSlideshareInfo(function (data) {
    $('#iframe-slideshare').attr('src', "//www.slideshare.net/slideshow/embed_code/" + data.slideshow_id);
  });
}