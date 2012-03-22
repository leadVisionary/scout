EverythingStrategy = require '../EverythingStrategy.js'

describe "EverythingStrategy", ()->
  describe "#retrieve", (done) ->
    it("should retrieve everything and apply no transformation") ->
       data = [4, 3, 2]
       result = EverythingStrategy.apply(data)
       result.should.equal data
       done()
