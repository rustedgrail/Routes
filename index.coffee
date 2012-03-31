Routes = require('./routes').Routes
paths = require './paths'

routes = new Routes paths
onRequest = (request, response) ->
  path = routes.getPath request.url
  routes.writeResponse path, response

app = require('http').createServer onRequest

port = process.env.PORT || 8888
app.listen port
