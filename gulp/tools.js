var Tools = {
  getScripts: function (assets) {
    var vendor = assets.scripts.vendor.elements.map(function(script) {
      return assets.scripts.vendor.prefix + script;
    });
    var custom = assets.scripts.custom.elements.map(function(script) {
      return assets.scripts.custom.prefix + script;
    });
    return vendor.concat(custom);
  },
  getStyles: function (assets) {
    var vendor = assets.styles.vendor.elements.map(function(style) {
      return assets.styles.vendor.prefix + style;
    });
    var custom = assets.styles.custom.elements.map(function(style) {
      return assets.styles.custom.prefix + style;
    });
    return vendor.concat(custom);
  },
  getExtension: function (conf, type) {
    var isMinified = conf.uglify[type],
        fileName = conf.fileNames[type],
        baseName = isMinified ? fileName + '.min.' : fileName + '.',
        extension = type ===  'styles' ? 'css' : 'js'
    return baseName + extension;
  }
};

module.exports = Tools;
