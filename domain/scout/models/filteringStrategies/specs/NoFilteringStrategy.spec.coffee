NoFilteringStrategy = require '../NoFilteringStrategy'
require 'should'

noFilteringStrategist = new NoFilteringStrategy()

describe 'NoFilteringStrategy', ->
  describe '#retrieve',  ->
    it 'should retrieve everything and apply no transformation', ->
       data = [4, 3, 2]
       result = noFilteringStrategist.applyFilter data 
       result.should.equal data
