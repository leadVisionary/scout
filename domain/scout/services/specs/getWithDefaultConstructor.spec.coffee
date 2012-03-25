Scout = require '../../Scout'
require 'should'
http = require('http')
url = require('url')

before ->
  onRequest = (request, response) ->
    pathname = url.parse(request.url).pathname
    if pathname == "/valid"
      response.writeHead 200, "Content-Type": "text/plain"
      response.write "page was found"
    else if pathname == "/error310"
      response.writeHead 310, "Content-Type": "text/plain"
      response.write "this is an error"
    else
      response.writeHead 404, "Content-Type": "text/plain"
      response.write "page not found"
    response.end()
  http.createServer(onRequest).listen 9876

describe 'Using Default Constructor', ->
  describe '#get',  ->
    it 'should get the contents of an http location',(done)->
      scout = new Scout()
      scout.get "http://localhost:9876/valid", (data)=>
        data.should.equal "page was found"
        done()
