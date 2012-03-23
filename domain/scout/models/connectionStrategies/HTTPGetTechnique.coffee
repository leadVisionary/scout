RetrievalTechnique = require './RetrievalTechnique'
http = require 'http'
url = require 'url'

class HTTPGetTechnique extends RetrievalTechnique
  retrieve: (location) -> 

    # locationElements = url.parse
    #options = {
    #   host: 'www.google.com',
    #   port: 80,
    #   path: '/index.html'
    #}
    #http.get(options, function(res) {
    #   console.log("Got response: " + res.statusCode);
    
module.exports = HTTPGetTechnique
