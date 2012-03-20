(function() {
  var Routes, paths;

  Routes = require('../routes').Routes;

  paths = require('../paths');

  describe('the routing framework', function() {
    beforeEach(function() {
      return this.routes = new Routes(paths);
    });
    it('can get a file extension', function() {
      var ext;
      ext = this.routes.getExtension('favicon.ico');
      return expect(ext).toBe("ico");
    });
    it('can find the root path', function() {
      var path;
      path = this.routes.getPath('/');
      return expect(path).toBe('./views/index.html');
    });
    it('can return a 404 page', function() {
      var path;
      path = this.routes.getPath('/ThisPageWillNeverExists.html');
      return expect(path).toBe('./views/404.html');
    });
    return it('can return a static page', function() {
      var path;
      path = this.routes.getPath('/index.html');
      return expect(path).toBe('./views/index.html');
    });
  });

}).call(this);
