Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
EchoInputTechnique = require '../../models/connectionTechniques/EchoInputTechnique'
require 'should'

describe 'Given a strategy argument', ->
  describe '#get',  ->
    it 'should get data according to the strategy',(done)->
      scout = new Scout(EchoInputTechnique)
      data = [0..10]
      class EveryOtherStrategy extends FilteringStrategy
        applyFilter: (data) ->
          (x for x in data[0..data.length] by 2)
 
      callback = (result) =>
        result.should.not.eql data
        result.should.eql (x for x in data[0..data.length] by 2)
        done()

      scout.get data, callback, EveryOtherStrategy
