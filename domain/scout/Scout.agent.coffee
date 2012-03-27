NoFilteringStrategy = require('./models/filteringStrategies/NoFilteringStrategy')
NoFormattingStrategy = require('./models/formattingStrategies/NoFormattingStrategy')
HTTPGetStrategy = require('./models/retrievalStrategies/HTTPGetStrategy')
FilteringStrategy = require('./models/filteringStrategies/FilteringStrategy')
FormattingStrategy = require('./models/formattingStrategies/FormattingStrategy')
RetrievalStrategy = require('./models/retrievalStrategies/RetrievalStrategy')
get = require('./services/get.coffee')

class Scout
  constructor: (@retriever = HTTPGetStrategy, @formatter = NoFormattingStrategy, @filterer = NoFilteringStrategy)->

  
  get: (location, callback, filter = @filterer) -> get(location, callback, @retriever, filter, @formatter)

  checkClassMembership: (strategy, parentClass) ->
    if new strategy instanceof parentClass
      return YES
    else
      throw "Strategy of invalid type"

  setFilterer: (strategy) -> @filterer = strategy
  setFormatter: (strategy) -> @formatter = strategy
  setRetriever: (strategy) -> @retriever = strategy

module.exports = Scout
