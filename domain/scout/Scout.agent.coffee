EverythingStrategy = require('./models/filteringStrategies/EverythingStrategy')
NoTransformation = require('./models/formattingStrategies/NoTransformation')
HTTPGetTechnique = require('./models/connectionTechniques/HTTPGetTechnique')
get = require('./services/get.coffee')

class Scout
  constructor: (@retrievalTechnique = HTTPGetTechnique, @formatter = NoTransformation, @strategy = EverythingStrategy)->
  
  get: (location, callback, strategy = @strategy) -> get(location, callback, @retrievalTechnique, strategy, @formatter)
  setStrategy: (strategy) -> @strategy = strategy
  setFormatter: (formatter) -> @formatter = formatter
  setTechnique: (technique) -> @retrievalTechnique = technique

module.exports = Scout
