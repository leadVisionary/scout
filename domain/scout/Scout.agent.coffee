NoFilteringStrategy = require('./models/filteringStrategies/NoFilteringStrategy')
NoFormattingStrategy = require('./models/formattingStrategies/NoFormattingStrategy')
HTTPGetStrategy = require('./models/retrievalStrategies/HTTPGetStrategy')
get = require('./services/get.coffee')

class Scout
  constructor: (@retriever = HTTPGetStrategy, @formatter = NoFormattingStrategy, @filterer = NoFilteringStrategy)->
  
  get: (location, callback, filter = @filterer) -> get(location, callback, @retriever, filter, @formatter)
  setFilterer: (strategy) -> @filterer = strategy
  setFormatter: (strategy) -> @formatter = strategy
  setRetriever: (strategy) -> @retriever = strategy

module.exports = Scout
