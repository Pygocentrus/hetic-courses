var conf = {
  paths: {
    baseName: "http://localhost:3000/",
    src: "app",
    assetDist: "api/public",
    htmlDist: "api/app"
  },
  fileNames: {
    scripts: "production",
    styles: "production",
    html: "application"
  },
  uglify: {
    scripts: false,
    styles: false,
    html: false
  },
  versioning: {
    scripts: false,
    styles: false
  },
  handlebarOpts: {
    helpers: {
      assetPath: function (path, context) {
        var extension = path.split('.').pop(),
            type = extension === 'css' ? 'styles' : 'scripts',
            fileName = conf.fileNames[type],
            path = fileName + (conf.uglify[type] ? '.min.' : '.') + extension;
        return "assets/" + context.data.root[path];
      },
      baseName: function () {
        return conf.paths.baseName;
      }
    }
  }
};

module.exports = conf;
