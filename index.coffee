app = require('http').createServer require('./routes').onRequest
app.listen process.env.PORT || 8888
