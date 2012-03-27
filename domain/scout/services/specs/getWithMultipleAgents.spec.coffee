Scout = require '../../Scout'
EchoInputStrategy = require '../../models/retrievalStrategies/EchoInputStrategy'
http = require 'http'
require 'should'

pageResponse = "Retrieval was successful"
server = {}
serverPort = 9876

before =>
  onRequest = (request, response) ->
    response.writeHead 200, "Content-Type": "text/plain"
    response.write pageResponse
    response.end()
 
  tryNextPort = (error)=>
    if error.code == 'EADDRINUSE'
      if serverPort < 9900
        serverPort++
        server.listen serverPort, http.INADDR_ANY
      
  server = http.createServer(onRequest)
  server.on 'error', tryNextPort
  server.listen serverPort, http.INADDR_ANY


describe 'When using multiple scouts with different strategies', ->
  describe '#get', ->
    it "should not be affected by other scouts", (done) ->
      httpScout = new Scout()
      echoScout = new Scout()
      echoScout.setRetriever EchoInputStrategy

      dataToEcho = "Repeat me"

      httpScout.get "http://localhost:#{serverPort}/", (httpData)=>
        httpData.should.eql pageResponse
        echoScout.get dataToEcho, (echoData)=>
          echoData.should.eql dataToEcho
          done()

 
