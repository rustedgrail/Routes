Routes = require('./routes').Routes

onRequest = (request, response) ->
  console.log "Request #{request.url}"
  path = Routes.getPath request.url
  console.log "Path #{path}"
  Routes.writeResponse path, response

app = require('http').createServer onRequest

port = process.env.PORT || 8888
app.listen port
