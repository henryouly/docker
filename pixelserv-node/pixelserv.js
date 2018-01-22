var https = require('https');
var http = require('http');
var fs = require('fs');

// Defaults
config = {
	host: '0.0.0.0',
	port: 8080,
	ssl_port:4443,
	imageData: "R0lGODlhAQABAIAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
}

// Store imageData buffer
buffer = new Buffer(config.imageData, encoding='base64');

const options = {
	key: fs.readFileSync('server.pem'),
	cert: fs.readFileSync('server.pem')
};

const reply = (req, res) => {
	res.writeHead(200, {'Content-Type': 'image/gif'});
	res.write(buffer.toString('binary'), 'binary');
	res.end();
}
// Create/Start server
http.createServer(reply).listen(config.port);
https.createServer(options, reply).listen(config.ssl_port);

console.log('pixelserv.js started on port: ' + config.port);
