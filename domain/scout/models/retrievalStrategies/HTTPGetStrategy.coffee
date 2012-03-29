RetrievalStrategy = require './RetrievalStrategy'
http = require 'http'
url = require 'url'

validateURLElements = (elements) ->
  if !elements.hostname? or elements.protocol != "http:"
    console.log "Throwing!"
    throw new Error "Invalid URL"

class HTTPGetStrategy extends RetrievalStrategy
  retrieve: (location, callback) ->
    locationElements = url.parse location
    console.log "host: #{locationElements.hostname} protocol: #{locationElements.protocol}"
    validateURLElements locationElements
    options = {
       hostname: locationElements.hostname
       port: locationElements.port
       path: locationElements.path
    }
    request = http.request options, (results) ->
      statusCode = results.statusCode
      resultsData = ""
      if statusCode != 200
        resultsData += "#{statusCode}"
      else
        results.on 'data', (chunk)=>
          resultsData += chunk

      results.on 'end', =>
        callback(resultsData)
    request.end()
    
module.exports = HTTPGetStrategy
