Scout = require '../../Scout'
require 'should'
http = require('http')
url = require('url')

server = {}
serverPort = 9876

before =>
  onRequest = (request, response) ->
    pathname = url.parse(request.url).pathname
    if pathname == "/valid"
      response.writeHead 200, "Content-Type": "text/plain"
      response.write "page was found"
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


describe 'Using Default Constructor', ->
  describe '#get',  ->
    it 'should get the contents of an http location',(done)->
      scout = new Scout()
      scout.get "http://localhost:#{serverPort}/valid", (data)=>
        data.should.equal "page was found"
        done()
