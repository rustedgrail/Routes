Routes = require('./routes').Routes
paths = require './paths'

onRequest = (request, response) ->
  routes = new Routes paths
  console.log "Request #{request.url}"
  path = routes.getPath request.url
  console.log "Path #{path}"
  routes.writeResponse path, response

app = require('http').createServer onRequest

port = process.env.PORT || 8888
app.listen port
