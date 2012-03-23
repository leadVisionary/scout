EverythingStrategy = require '../EverythingStrategy'
require 'should'

everythingStrategist = new EverythingStrategy()

describe 'EverythingStrategy', ->
  describe '#retrieve',  ->
    it 'should retrieve everything and apply no transformation', ->
       data = [4, 3, 2]
       result = everythingStrategist.applyFilter data 
       result.should.equal data
