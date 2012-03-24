RetrievalTechnique = require './RetrievalTechnique'

#This is for mocking input during testing
class EchoInputTechnique extends RetrievalTechnique
  retrieve: (location, callback)->
    callback location

module.exports = EchoInputTechnique
