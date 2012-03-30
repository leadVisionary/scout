RetrievalStrategy = require './RetrievalStrategy'

class EchoInputStrategy extends RetrievalStrategy
  retrieve: (location, callback)->
    callback location

module.exports = EchoInputStrategy
