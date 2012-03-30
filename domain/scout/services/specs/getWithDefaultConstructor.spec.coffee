Scout = require '../../Scout'
require 'should'

describe 'Using Default Constructor', ->
  describe '#get',  ->
    it 'should echo its input',(done)->
      scout = new Scout()
      response = "I'm the response"
      scout.get response, (data)=>
        data.should.eql response
        done()
