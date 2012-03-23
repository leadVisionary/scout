EverythingStrategy = require '../EverythingStrategy'
require 'should'

boo = new EverythingStrategy()

describe 'EverythingStrategy', ->
  describe '#retrieve',  ->
    it 'should retrieve everything and apply no transformation', ->
       data = [4, 3, 2]
       result = boo.applyFilter(data)
       result.should.equal data
