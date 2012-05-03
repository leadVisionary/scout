FilteringStrategy = require '../../models/FilteringStrategy'

class EveryOtherStrategy extends FilteringStrategy
  applyFilter: (data) ->
    (x for x in data[0..data.length] by 2)

module.exports = EveryOtherStrategy
