require 'should'
NoTransformation = require '../NoTransformation.coffee'

describe "NoTranformation", ()->
  describe "#transform", ()->
    it "should not transform its input", (done)->
      data = [8, 6, 7, 5. 3. 0. 9]
      tranformedData = NoTranformation.apply data
      transformedData.should.equal data
      done()
