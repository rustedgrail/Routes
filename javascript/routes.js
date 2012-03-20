(function() {
  var FileTypes, Routes, fs, path, url;

  fs = require('fs');

  path = require('path');

  url = require('url');

  FileTypes = require('./fileTypes');

  exports.Routes = Routes = (function() {

    function Routes(paths) {
      this.paths = paths;
    }

    Routes.prototype.getPath = function(rawUrl) {
      var base, parsedUrl;
      parsedUrl = url.parse(rawUrl, true);
      base = this.paths[path.extname(parsedUrl.pathname)];
      if (parsedUrl.pathname === '/') {
        return "./" + this.paths['.html'] + "/index.html";
      } else if (path.existsSync("./" + base + parsedUrl.pathname)) {
        return "./" + base + parsedUrl.pathname;
      } else {
        return "./" + base + "/404.html";
      }
    };

    Routes.prototype.writeResponse = function(path, response) {
      return fs.readFile(path, function(err, data) {
        var contentType;
        try {
          contentType = FileTypes[path.extname(path)];
          response.writeHead(200, {
            "Content-Type": contentType,
            "Content-Length": data.length
          });
          response.write(data);
          return response.end;
        } catch (err) {
          console.log("Trying to reach " + path);
          return console.log(err);
        }
      });
    };

    return Routes;

  })();

}).call(this);
