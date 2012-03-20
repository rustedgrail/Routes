(function() {
  var Routes, app, onRequest, paths, port;

  Routes = require('./routes').Routes;

  paths = require('./paths');

  onRequest = function(request, response) {
    var path, routes;
    routes = new Routes(paths);
    console.log("Request " + request.url);
    path = routes.getPath(request.url);
    console.log("Path " + path);
    return routes.writeResponse(path, response);
  };

  app = require('http').createServer(onRequest);

  port = process.env.PORT || 8888;

  app.listen(port);

}).call(this);
