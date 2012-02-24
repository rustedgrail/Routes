fs = require 'fs'
path = require 'path'
url = require 'url'

FileTypes = require('./fileTypes')

exports.Routes = class Routes
  constructor: (@paths) ->

  getPath: (rawUrl) ->
    parsedUrl = url.parse(rawUrl, true)
    base = @paths[@getExtension(parsedUrl.pathname)]

    if parsedUrl.pathname == '/'
      "./#{@paths['html']}/index.html"
    else if path.existsSync "./#{base}#{parsedUrl.pathname}"
      "./#{base}#{parsedUrl.pathname}"
    else
      "./#{base}/404.html"

  writeResponse: (path, response) ->
    fs.readFile path, (err, data) ->
      try
        contentType = FileTypes[@getExtension(path)]
        response.writeHead 200,
          "Content-Type": contentType
          "Content-Length": data.length
        response.write data
        response.end
      catch err
        console.log "Trying to reach #{path}"
        console.log err

  getExtension: (path) ->
    parts = path.split '.'
    parts[parts.length - 1]
