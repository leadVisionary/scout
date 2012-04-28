get = (location, callback, retriever, filterer, formatter)->
  decoratedCallback = (data)->
    callback formatter.applyFormat filterer.applyFilter data
  retriever.retrieve location, decoratedCallback

module.exports = get
