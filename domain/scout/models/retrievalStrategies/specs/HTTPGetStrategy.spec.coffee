HTTPGetStrategy = require '../HTTPGetStrategy'
require 'should'
http = require('http')
url = require('url')
httpGetter = new HTTPGetStrategy()

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

describe 'HTTPGetStrategy', ->
  describe '#get',  ->
    it 'should get the contents of an http location', ->
      httpGetter.retrieve "http://localhost:9876/valid", (data)->
        data.should.equal "page was found"

  describe '#error', ->
    it 'should return an error code if an error occurs during the request', ->
      httpGetter.retrieve "http://localhost:9876/error310", (data)->
        data.should.equal "310"
      httpGetter.retrieve "http://localhost:9876/invalid", (data)->
        data.should.equal "404"

