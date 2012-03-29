Scout = require '../../Scout'
require 'should'

describe 'Using Default Constructor', ->
  describe '#get',  ->
    it 'should echo what was done',(done)->
      scout = new Scout()
      scout.get "boogah", (data)=>
        data.should.equal "boogah"
        done()
