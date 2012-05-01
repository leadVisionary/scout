FormattingStrategy = require '../FormattingStrategy.coffee'
require 'should'

transformer = new FormattingStrategy()

describe 'FormattingStrategy', ->
  describe '#transform', ->
    it 'should not transform its input by default', ->
      data = [1, 2, 3]
      transformedData = transformer.applyFormat data
      transformedData.should.equal data
