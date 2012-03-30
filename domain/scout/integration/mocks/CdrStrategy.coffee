RetrievalStrategy = require '../../models/retrievalStrategies/RetrievalStrategy'

class CdrStrategy extends RetrievalStrategy
  retrieve: (location, callback) ->
    callback location[1...location.length]

module.exports = CdrStrategy
