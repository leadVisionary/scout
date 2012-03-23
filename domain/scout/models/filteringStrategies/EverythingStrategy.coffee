FilteringStrategy = require './FilteringStrategy'
class EverythingStrategy extends FilteringStrategy
  applyFilter: (data) -> data

module.exports = EverythingStrategy
