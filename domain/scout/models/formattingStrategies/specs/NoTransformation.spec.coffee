NoTransformation = require '../NoTransformation.coffee'
require 'should'

transformer = new NoTransformation()

describe 'NoTranformation', ->
  describe '#transform', ->
    it 'should not transform its input', ->
      data = [1, 2, 3]
      transformedData = transformer.applyFormat(data)
      transformedData.should.equal data
