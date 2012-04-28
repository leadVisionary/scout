Scout = require '../../Scout'
FilteringStrategy = require '../../models/filteringStrategies/FilteringStrategy'
EveryOtherStrategy = require './mocks/EveryOtherStrategy'
require 'should'

describe 'Given a filtering strategy argument', ->
  describe '#get', ->
    it 'should get data and filter it according to the strategy',(done)->
      scout = new Scout()
      data = [0..10]
      callback = (result)->
        result.should.not.eql data
        result.should.eql (x for x in data[0..data.length] by 2)
        done()
      scout.get data, callback, EveryOtherStrategy
