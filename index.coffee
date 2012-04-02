app = require('http').createServer require('./routes').onRequest

port = process.env.PORT || 8888
app.listen port
