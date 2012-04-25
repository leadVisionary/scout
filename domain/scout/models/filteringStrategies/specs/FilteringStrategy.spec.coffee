FilteringStrategy = require '../FilteringStrategy'
require 'should'

filteringStrategist = new FilteringStrategy()

describe 'FilteringStrategy', ->
  describe '#retrieve',  ->
    it 'should retrieve everything and apply no transformation', ->
       data = [4, 3, 2]
       result = filteringStrategist.applyFilter data
       result.should.equal data
