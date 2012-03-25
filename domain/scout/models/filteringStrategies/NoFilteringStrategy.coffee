FilteringStrategy = require './FilteringStrategy'
class NoFilteringStrategy extends FilteringStrategy
  applyFilter: (data) -> data

module.exports = NoFilteringStrategy
