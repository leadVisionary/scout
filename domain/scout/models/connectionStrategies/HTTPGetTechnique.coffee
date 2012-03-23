RetrievalTechnique = require './RetrievalTechnique'
http = require 'http'
url = require 'url'

class HTTPGetTechnique extends RetrievalTechnique
  retrieve: (location, callback) ->
    locationElements = url.parse location
    options = {
       hostname: locationElements.hostname
       port: locationElements.port
       path: locationElements.path
    }
    request = http.request options, (results) ->
      statusCode = results.statusCode
      resultsData = ""
      resultsData += "#{statusCode}" if statusCode != 200
      results.on 'data', (chunk)=>
        resultsData += chunk

      results.on 'end', =>
        callback(resultsData)
    request.end()
    
module.exports = HTTPGetTechnique
