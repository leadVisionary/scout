Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
EverythingStrategy = require '../../models/filteringStrategies/EverythingStrategy'
FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'
EchoInputTechnique = require '../../models/connectionTechniques/EchoInputTechnique'
HTTPGetTechnique = require '../../models/connectionTechniques/HTTPGetTechnique'
NoTransformation = require '../../models/formattingStrategies/NoTransformation'
http = require('http')

pageResponse = "Retrieval was successful"

before ->
  onRequest = (request, response) ->
    response.writeHead 200, "Content-Type": "text/plain"
    response.write pageResponse
    response.end()
  http.createServer(onRequest).listen 9988

require 'should'
describe 'When constructors, accessors, and arguements are all used', ->
  describe '#get', ->
    it 'should behave as appropriate for the most recent assignments', (done)->
      class ArrayToString extends FormattingStrategy
        applyFormat: (data) ->
          data.join()
      class EveryOtherStrategy extends FilteringStrategy
        applyFilter: (data) ->
          (x for x in data[0..data.length] by 2)
      class Return2Strategy extends FilteringStrategy
        applyFilter: (data) ->
          return 2

      scout = new Scout(EchoInputTechnique, ArrayToString, EveryOtherStrategy)
      scout.retrievalTechnique = HTTPGetTechnique
      scout.formatter = NoTransformation
      scout.strategy = Return2Strategy
      
      expectedResults = (results)=>
        results.should.eql pageResponse
        done()

      scout.get "http://localhost:9988", expectedResults, EverythingStrategy

