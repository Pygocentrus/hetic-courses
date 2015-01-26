// Custom configuration
var conf    = require('./gulp/conf.js'),
    assets  = require('./gulp/scripts.js'),
    tools   = require('./gulp/tools.js');

// NPM
var gulp       = require('gulp'),
    fs         = require('fs'),
    imagemin   = require('gulp-imagemin'),
    handlebars = require('gulp-compile-handlebars'),
    minifyHTML = require('gulp-minify-html'),
    jshint     = require('gulp-jshint'),
    sass       = require('gulp-sass'),
    concat     = require('gulp-concat'),
    uglify     = require('gulp-uglify'),
    rename     = require('gulp-rename'),
    rev        = require('gulp-rev'),
    csso       = require('gulp-csso'),
    del        = require('del');

// Sass task
gulp.task('sass', function() {
  var task = gulp.src(tools.getStyles(assets))
    .pipe(concat(tools.getExtension(conf, 'styles')))
    .pipe(sass());
    // .pipe(rename(tools.getExtension(conf, 'styles')));

  // If you want to uglify the css
  if (conf.uglify.styles) {
    task.pipe(csso())
  }

  // If you want a versioned file name (with unique hash)
  // which allows to prevent cache problems
  if (conf.versioning.styles) {
    task.pipe(rev())
      .pipe(gulp.dest(conf.paths.assetDist + '/assets'))
      .pipe(rev.manifest("rev-styles.json", { merge: true }))
      .pipe(gulp.dest(conf.paths.assetDist + '/assets'));
  } else {
    task.pipe(gulp.dest(conf.paths.assetDist + '/assets'))
  }
});

// Javascript tast
gulp.task('scripts', function() {
  var task = gulp.src(tools.getScripts(assets))
      .pipe(concat(tools.getExtension(conf, 'scripts')));

  // If you want to uglify the js
  if (conf.uglify.scripts) {
    task.pipe(uglify({ mangle: false }));
  }

  // If you want a versioned file name (with unique hash)
  // which allows to prevent cache problems
  if (conf.versioning.scripts) {
    return task.pipe(rev())
      .pipe(gulp.dest(conf.paths.assetDist + '/assets'))
      .pipe(rev.manifest("rev-scripts.json", { merge: true }))
      .pipe(gulp.dest(conf.paths.assetDist + '/assets'));
  } else {
    return task.pipe(gulp.dest(conf.paths.assetDist + '/assets'))
  }
});

// Image optimisation task
gulp.task('images', function() {
  return gulp.src(conf.paths.src + '/images/**/*')
    .pipe(imagemin({ optimizationLevel: 3, progressive: true, interlaced: true }))
    .pipe(gulp.dest(conf.paths.assetDist + '/images'));
});

// Dev watch task
gulp.task('watch', function() {
  gulp.watch(conf.paths.src + '/scripts/**/*.js', ['scripts']);
  gulp.watch(conf.paths.src + '/styles/*.scss', ['sass']);
});

// Clean task to empty the dist/ folder
gulp.task('clean', function(cb) {
  del([
    conf.paths.assetDist + '/assets/*.js',
    conf.paths.assetDist + '/assets/*.css',
    conf.paths.assetDist + '/assets/*.json',
    '.tmp'
  ], cb);
});

// Compiles the index.hbs file with the proper
// concatenated, minified and versioned css and jss files
gulp.task('compile', ['scripts'], function () {
  var styleVersion = {},
      scriptVersion = {},
      manifest = {},
      jsFile = tools.getExtension(conf, 'scripts'),
      cssFile = tools.getExtension(conf, 'styles'),
      opts = { comments: true, spare: true },
      task;

  // Replaces the versioned css file or not
  if (conf.versioning.styles) {
    styleVersion = JSON.parse(fs.readFileSync(conf.paths.assetDist + '/assets/rev-styles.json', 'utf8'));
    manifest[cssFile] = styleVersion[cssFile];
  } else {
    manifest[cssFile] = cssFile;
  }

  // Replaces the versioned js file or not
  if (conf.versioning.scripts) {
    scriptVersion = JSON.parse(fs.readFileSync(conf.paths.assetDist + '/assets/rev-scripts.json', 'utf8'));
    manifest[jsFile] = scriptVersion[jsFile];
  } else {
    manifest[jsFile] = jsFile;
  }

  task = gulp.src(conf.paths.src + '/index.hbs')
    .pipe(handlebars(manifest, conf.handlebarOpts))
    .pipe(rename(conf.fileNames.html + '.html.erb'));

  // If you want to uglify the html
  if (conf.uglify.html) {
    task.pipe(minifyHTML(opts))
  }

  return task.pipe(gulp.dest(conf.paths.htmlDist + '/views/layouts'));
});

gulp.task('copy', function() {
  return gulp.src(conf.paths.src + '/views/**/*')
    .pipe(gulp.dest(conf.paths.assetDist + '/views'));
});

// Gulp tasks
gulp.task('default', ['clean', 'sass', 'scripts', 'compile', 'copy']);
gulp.task('prod', ['default', 'images']);
gulp.task('live', ['default', 'watch']);
