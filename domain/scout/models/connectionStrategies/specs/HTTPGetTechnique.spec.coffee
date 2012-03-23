HTTPGetTechnique = require '../HTTPGetTechnique'
require 'should'
http = require('http')
url = require('url')
httpGetter = new HTTPGetTechnique()

before ->
  onRequest = (request, response) ->
    pathname = url.parse(request.url).pathname
    if pathname == "/valid"
      response.writeHead 200, "Content-Type": "text/plain"
      response.write "page was found"
    else
      response.writeHead 404, "Content-Type": "text/plain"
      response.write "page not found"
    response.end()
  http.createServer(onRequest).listen 9876

describe 'HTTPGetTechnique', ->
  describe '#get',  ->
    it 'should get the contents of an http location', ->
      data = httpGetter.retrieve "localhost:9876/valid"
      data.should.equal "page was found"

  describe '#error', ->
    it 'should return an error code if an error occurs during the request', ->
      data = httpGetter.retrieve "localhost:9876/invalid"
      data.should.equal "404"

