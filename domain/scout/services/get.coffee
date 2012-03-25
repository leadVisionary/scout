get = (location, callback, retrievalTechnique, strategy, formatter) ->
  format = new formatter()
  filterer = new strategy()
  retriever = new retrievalTechnique()

  decoratedCallback = (data)=>
    callback format.applyFormat filterer.applyFilter data

  retriever.retrieve location, decoratedCallback

module.exports = get
