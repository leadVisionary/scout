Scout = require '../Scout'
CdrStrategy = require './mocks/CdrStrategy'
require 'should'

describe 'When using multiple scouts with different strategies', ->
  describe '#get', ->
    it "should not be affected by other scouts", (done) ->
      echoScout = new Scout()
      cdrScout = new Scout()
      cdrScout.setRetriever CdrStrategy

      dataToEcho = "Repeat me"
      dataToCdr = [1..10]

      echoScout.get dataToEcho, (echoData)=>
        echoData.should.eql dataToEcho
        cdrScout.get dataToCdr, (cdrData)=>
          cdrData.should.eql [2..10]
          done()

 
