get = (location, callback, retrievalTechnique, strategy, formatter) ->
  format = new formatter()
  filterer = new strategy()
  retriever = new retrievalTechnique()
  format.applyFormat filterer.applyFilter retriever.retrieve location, callback

module.exports = get
