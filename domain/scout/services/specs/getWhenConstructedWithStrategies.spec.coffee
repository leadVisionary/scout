Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'
RetrievalStrategy = require '../../models/retrievalStrategies/RetrievalStrategy'
EchoInputStrategy = require '../../models/retrievalStrategies/EchoInputStrategy'
CdrStrategy = require './mocks/CdrStrategy'
EveryOtherStrategy = require './mocks/EveryOtherStrategy'
ArrayToStringStrategy = require './mocks/ArrayToStringStrategy'

require 'should'

describe 'When constructed with a custom retrieval technique', ->
  describe '#get', ->
    it 'should return results', (done)->
      data = [0..10]
      connectionScout = new Scout(CdrStrategy)

      connectionScout.get data, (results)->
        results.should.eql [1..10]
        done()

describe 'When constructed with a custom formatter', ->
  describe '#get', ->
    it 'should reformat results', (done)->
      data = [0..10]
      formatScout = new Scout(EchoInputStrategy, ArrayToStringStrategy)

      formatScout.get data, (results)->
        results.should.eql data.join()
        done()

describe 'When constructed with a custom filter', ->
  describe '#get', ->
    it 'should apply filter to results', (done)->
      filterScout = new Scout(EchoInputStrategy, FormattingStrategy, EveryOtherStrategy)

      data = (x for x in [0..10])
      filterScout.get data, (results)->
        data.should.not.eql results
        results.should.eql (x for x in [0..10] by 2)
        done()


