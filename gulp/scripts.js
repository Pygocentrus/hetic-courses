var requirements = {
  scripts: {
    vendor: {
      prefix: 'bower_components',
      elements: [
        '/angular/angular.js',
        '/angular-resource/angular-resource.js',
        '/angular-route/angular-route.js',
        '/jquery/dist/jquery.js',
        '/bootstrap/dist/js/bootstrap.js'
      ]
    },
    custom: {
      prefix: 'app/scripts',
      elements: [
        '/lib/webtoolkitsha1.js',
        '/lib/slideshare.js',
        '/lib/course.js',
        '/app.js',
        '/controllers/about.js',
        '/controllers/main.js',
        '/lib/analytics.js'
      ]
    }
  },
  styles: {
    vendor: {
      prefix: 'bower_components',
      elements: [
        '/bootstrap/dist/css/bootstrap.css',
        '/bootstrap/dist/css/bootstrap-theme.css'
      ]
    },
    custom: {
      prefix: 'app/styles',
      elements: [
        '/main.scss',
        '/search.scss'
      ]
    }
  }
};

module.exports = requirements;
