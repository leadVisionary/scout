Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
NoFilteringStrategy = require '../../models/filteringStrategies/NoFilteringStrategy'
FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'
EchoInputStrategy = require '../../models/retrievalStrategies/EchoInputStrategy'
HTTPGetStrategy = require '../../models/retrievalStrategies/HTTPGetStrategy'
NoFormattingStrategy = require '../../models/formattingStrategies/NoFormattingStrategy'
http = require('http')

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


require 'should'
describe 'When constructors, accessors, and arguments are all used', ->
  describe '#get', ->
    it 'should behave appropriately for the most recent assignments', (done)->

      class ArrayToString extends FormattingStrategy
        applyFormat: (data) ->
          data.join()
      class EveryOtherStrategy extends FilteringStrategy
        applyFilter: (data) ->
          (x for x in data[0..data.length] by 2)
      class Return2Strategy extends FilteringStrategy
        applyFilter: (data) ->
          return 2

      scout = new Scout(EchoInputStrategy, ArrayToString, EveryOtherStrategy)
      scout.setRetriever(HTTPGetStrategy)
      scout.setFormatter(NoFormattingStrategy)
      scout.setFilterer(Return2Strategy)
      
      expectedResults = (results)=>
        results.should.eql pageResponse
        done()

      scout.get "http://localhost:#{serverPort}", expectedResults, NoFilteringStrategy

