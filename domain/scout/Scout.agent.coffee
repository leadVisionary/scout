NoFilteringStrategy = require('./models/filteringStrategies/NoFilteringStrategy')
NoFormattingStrategy = require('./models/formattingStrategies/NoFormattingStrategy')
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
    throw "Strategy is of invalid type"

class Scout
  setFilterer: (strategy) -> @filterer = strategy if checkClassMembership strategy, FilteringStrategy
  setFormatter: (strategy) -> @formatter = strategy if checkClassMembership strategy, FormattingStrategy
  setRetriever: (strategy) -> @retriever = strategy if checkClassMembership strategy, RetrievalStrategy
 
  constructor: (retriever = EchoInputStrategy, formatter = NoFormattingStrategy, filterer = NoFilteringStrategy)->
    @setFilterer filterer
    @setFormatter formatter
    @setRetriever retriever

  get: (location, callback, filter = @filterer) -> get(location, callback, @retriever, filter, @formatter)

module.exports = Scout
module.exports.FilteringStrategy = FilteringStrategy
module.exports.FormattingStrategy = FormattingStrategy
module.exports.RetrievalStrategy = RetrievalStrategy
