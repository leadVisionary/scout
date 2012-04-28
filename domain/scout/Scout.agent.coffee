EchoInputStrategy = require('./models/retrievalStrategies/EchoInputStrategy')
FilteringStrategy = require('./models/filteringStrategies/FilteringStrategy')
FormattingStrategy = require('./models/formattingStrategies/FormattingStrategy')
RetrievalStrategy = require('./models/retrievalStrategies/RetrievalStrategy')
get = require('./services/get')

checkClassMembership = (strategy, parentClass) ->
  #instanceof will behave poorly if strategies input are not written in coffeescript
  strategyObject = new strategy()
  if strategyObject instanceof parentClass
    return true
  else
    throw new Error "Strategy is of invalid type"

class Scout
  setFilterer: (strategy) -> @filterer = strategy if checkClassMembership strategy, FilteringStrategy
  setFormatter: (strategy) -> @formatter = strategy if checkClassMembership strategy, FormattingStrategy
  setRetriever: (strategy) -> @retriever = strategy if checkClassMembership strategy, RetrievalStrategy
 
  constructor: (retriever = EchoInputStrategy, formatter = FormattingStrategy, filterer = FilteringStrategy)->
    @setFilterer filterer
    @setFormatter formatter
    @setRetriever retriever

  get: (location, callback, filteringStrategy = @filterer) ->
    retriever = new @retriever()
    filterer = new filteringStrategy()
    formatter = new @formatter()
    get location, callback, retriever, filterer, formatter

module.exports = Scout
module.exports.FilteringStrategy = FilteringStrategy
module.exports.FormattingStrategy = FormattingStrategy
module.exports.RetrievalStrategy = RetrievalStrategy
