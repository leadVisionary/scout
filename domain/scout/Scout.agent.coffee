EverythingStrategy = require('./models/EverythingStrategy')
NoTransformation = require('./models/NoTransformation')
APIConnectTechnique = require('./models/APIConnectTechnique')
get = require('./services/get.coffee')

class Scout
  constructor(@retrievalTechnique=APIConnectTechnique, @formatter=NoTransformation, @strategy=EverythingStrategy):
  
  get: (location) -> get(location, @strategy)
  get: (location, strategy) -> get(location, strategy)
  setStrategy: (strategy) -> @strategy = strategy
  setFormatter: (formatter) -> @formatter = formatter
  setTechnique: (technique) -> @retrievalTechnique = technique
