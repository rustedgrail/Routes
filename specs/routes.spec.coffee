Routes = require('../routes').Routes
paths = require '../paths'

describe 'the routing framework', ->
  beforeEach ->
    @routes = new Routes paths

  it 'can find the root path', ->
    path = @routes.getPath '/'
    expect(path).toBe './views/index.html'

  it 'can return a 404 page', ->
    path = @routes.getPath '/ThisPageWillNeverExists.html'
    expect(path).toBe './views/404.html'

  it 'can return a static page', ->
    path = @routes.getPath '/index.html'
    expect(path).toBe './views/index.html'
