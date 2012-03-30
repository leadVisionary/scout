Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'
CdrStrategy = require './mocks/CdrStrategy'
EveryOtherStrategy = require './mocks/EveryOtherStrategy'
ArrayToStringStrategy = require './mocks/ArrayToStringStrategy'

require 'should'

describe 'When retrieval technique is changed', ->
  describe '#get', ->
    it 'should return results', (done)->
      data = [0..10]
      connectionScout = new Scout()

      connectionScout.setRetriever(CdrStrategy)

      connectionScout.get data, (results)=>
        results.should.eql [1..10]
        done()

describe 'When formatter is changed', ->
  describe '#get', ->
    it 'should reformat results', (done)->
      data = [0..10]
      formatScout = new Scout()

      formatScout.setFormatter(ArrayToStringStrategy)

      formatScout.get data, (results)=>
        results.should.eql data.join()
        done()

describe 'When filterer is changed', ->
  describe '#get', ->
    it 'should apply filter to results', (done)->
      filterScout = new Scout()

      filterScout.setFilterer(EveryOtherStrategy)

      data = (x for x in [0..10])
      filterScout.get data, (results)=>
        data.should.not.eql results
        results.should.eql (x for x in [0..10] by 2)
        done()


