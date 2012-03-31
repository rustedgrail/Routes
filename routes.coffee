fs = require 'fs'
path = require 'path'
url = require 'url'

FileTypes = require('./fileTypes')

exports.Routes = class Routes
  constructor: (@paths) ->

  getPath: (rawUrl) ->
    parsedUrl = url.parse(rawUrl, true)
    base = @paths[path.extname(parsedUrl.pathname)]

    if parsedUrl.pathname == '/'
      "./#{@paths['.html']}/index.html"
    else if path.existsSync "./#{base}#{parsedUrl.pathname}"
      "./#{base}#{parsedUrl.pathname}"
    else
      "./#{base}/404.html"

  writeResponse: (filePath, response) ->
    data = fs.readFileSync filePath
    try
      contentType = FileTypes[path.extname(filePath)]
      response.writeHead 200,
        "Content-Type": contentType
        "Content-Length": data.length
      response.end data, 'utf-8'
    catch err
      console.log "Trying to reach #{filePath}"
      console.log err
