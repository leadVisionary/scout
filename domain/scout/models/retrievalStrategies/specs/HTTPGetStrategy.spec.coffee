HTTPGetStrategy = require '../HTTPGetStrategy'
require 'should'
http = require('http')
url = require('url')
httpGetter = new HTTPGetStrategy()

server = {}
serverPort = 9876

pageFoundResponse = "page was found"

before ->
  onRequest = (request, response) ->
    pathname = url.parse(request.url).pathname
    if pathname == "/valid"
      response.writeHead 200, "Content-Type": "text/plain"
      response.write pageFoundResponse
    else if pathname == "/error310"
      response.writeHead 310, "Content-Type": "text/plain"
      response.write "this is an error"
    else
      response.writeHead 404, "Content-Type": "text/plain"
      response.write "page not found"
    response.end()

  tryNextPort = (error)=>
    if error.code == 'EADDRINUSE'
      if serverPort < 9900
        serverPort++
        server.listen serverPort, http.INADDR_ANY
    
  server = http.createServer(onRequest)
  server.on 'error', tryNextPort
  server.listen serverPort, http.INADDR_ANY


describe 'HTTPGetStrategy', ->
  describe '#get',  ->
    it 'should get the contents of an http location', (done)->
      httpGetter.retrieve "http://localhost:#{serverPort}/valid", (data)->
        data.should.eql pageFoundResponse
        done()

  describe '#get', ->
    it 'should return an error code if an error occurs during the request', (done)->
      httpGetter.retrieve "http://localhost:#{serverPort}/error310", (data)->
        data.should.eql "310"
        done()

  describe '#get', ->
    it 'should return 404 if the resource is not found', (done)->
      httpGetter.retrieve "http://localhost:#{serverPort}/invalid", (data)->
        data.should.eql "404"
        done()

  describe '#get', ->
    it 'should throw an exception if given an invalid url', (done)->
      invalidRequest1 = ()->
        httpGetter.retrieve "this is not a valid URL", (data)->
      invalidRequest1.should.throw("Invalid URL")
      invalidRequest2 = ()->
        httpGetter.retrieve "http:www.google.com", (data)->
      invalidRequest2.should.throw("Invalid URL")
      done()

  describe '#get', ->
    it 'should throw an exception if url has no protocol', (done)->
      invalidRequest = ()->
        httpGetter.retrieve "www.google.com", (data)->
      invalidRequest.should.throw("Invalid URL")
      done()

  describe '#get', ->
    it 'should throw an exception if url protocol is not http', (done)->
      invalidRequest = ()->
        httpGetter.retrieve "ftp://www.google.com", (data)->
      invalidRequest.should.throw("Invalid URL")
      done()

