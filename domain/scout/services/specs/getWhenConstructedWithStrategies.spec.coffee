Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'
EchoInputStrategy = require '../../models/retrievalStrategies/EchoInputStrategy'
NoFormattingStrategy = require '../../models/formattingStrategies/NoFormattingStrategy'

require 'should'

describe 'When constructed with a custom retrieval technique', ->
  describe '#get', ->
    it 'should return results', (done)->
      data = [0..10]
      connectionScout = new Scout(EchoInputStrategy)

      connectionScout.get data, (results)=>
        results.should.eql data
        done()

describe 'When constructed with a custom formatter', ->
  describe '#get', ->
    it 'should reformat results', (done)->
      data = [0..10]
      class ArrayToString extends FormattingStrategy
        applyFormat: (data) ->
          data.join()
      formatScout = new Scout(EchoInputStrategy, ArrayToString)

      formatScout.get data, (results)=>
        results.should.eql data.join()
        done()

describe 'When constructed with a custom filter', ->
  describe '#get', ->
    it 'should apply filter to results', (done)->
      class EveryOtherStrategy extends FilteringStrategy
        applyFilter: (data) ->
          (x for x in data[0..data.length] by 2)
      filterScout = new Scout(EchoInputStrategy, NoFormattingStrategy, EveryOtherStrategy)

      data = (x for x in [0..10])
      filterScout.get data, (results)=>
        data.should.not.eql results
        results.should.eql (x for x in [0..10] by 2)
        done()


