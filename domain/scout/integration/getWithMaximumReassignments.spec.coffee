Scout = require '../Scout'
FilteringStrategy = require '../models/filteringStrategies/FilteringStrategy'
NoFilteringStrategy = require '../models/filteringStrategies/NoFilteringStrategy'
FormattingStrategy = require '../models/formattingStrategies/FormattingStrategy'
EchoInputStrategy = require '../models/retrievalStrategies/EchoInputStrategy'
NoFormattingStrategy = require '../models/formattingStrategies/NoFormattingStrategy'
CdrStrategy = require './mocks/CdrStrategy'
ArrayToStringStrategy = require './mocks/ArrayToStringStrategy'
EveryOtherStrategy = require './mocks/EveryOtherStrategy'

http = require('http')

require 'should'
describe 'When constructors, accessors, and arguments are all used', ->
  describe '#scout', ->
    it 'should behave appropriately for the most recent assignments', (done)->

      class Return2Strategy extends FilteringStrategy
        applyFilter: (data)->
          return 2

      scout = new Scout(CdrStrategy, ArrayToStringStrategy, EveryOtherStrategy)
      scout.setRetriever(EchoInputStrategy)
      scout.setFormatter(NoFormattingStrategy)
      scout.setFilterer(Return2Strategy)
      
      output = "This should be output"

      expectedResults = (results)=>
        results.should.eql output
        done()

      scout.get output, expectedResults, NoFilteringStrategy

