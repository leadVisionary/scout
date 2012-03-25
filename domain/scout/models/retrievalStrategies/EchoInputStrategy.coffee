RetrievalStrategy = require './RetrievalStrategy'

#This is for mocking input during testing
class EchoInputStrategy extends RetrievalStrategy
  retrieve: (location, callback)->
    callback location

module.exports = EchoInputStrategy
