#!/usr/bin/env python3
# taken from http://www.piware.de/2011/01/creating-an-https-server-in-python/
# generate server.xml with the following command:
#    openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes
# run as follows:
#    python simple-https-server.py
# then in your browser, visit:
#    https://localhost:443

from http.server import HTTPServer, BaseHTTPRequestHandler
import struct
import ssl
import argparse

class PixelServRequestHandler(BaseHTTPRequestHandler):
  PIXEL = struct.pack('<43B', 
    71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 128, 0, 0, 255, 255, 255, 
    0, 0, 0, 33, 249, 4, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 
    0, 0, 2, 2, 68, 1, 0, 59)

  def do_GET(self):
    self.send_response(200)
    self.send_header("Content-type", "image/gif")
    self.send_header("Content-length", len(self.PIXEL))
    self.send_header("Accept-ranges", "bytes")
    self.end_headers()
    self.wfile.write(self.PIXEL)
    return

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--host", default="0.0.0.0")
parser.add_argument("--port", type=int, default=443)
parser.add_argument("--certfile", default="./server.pem")
args = parser.parse_args()
httpd = HTTPServer((args.host, args.port), PixelServRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket, certfile=args.certfile, server_side=True)
httpd.serve_forever()
