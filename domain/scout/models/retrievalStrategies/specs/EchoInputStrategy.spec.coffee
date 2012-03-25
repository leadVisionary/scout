EchoInputStrategy = require '../EchoInputStrategy'
require 'should'

stringEchoer = new EchoInputStrategy()

describe 'EchoInputStrategy', ->
  describe '#retrieve', ->

    it 'should not modify its input', ->
      data = [8, 6, 7, 5, 3, 0, 9]
      inputData = data
      stringEchoer.retrieve inputData, (results)=>
        inputData.should.equal data

    it 'should return its input to its callback', ->
      data = [8, 6, 7, 5, 3, 0, 9]
      stringEchoer.retrieve data, (results)=>
        results.should.equal data

