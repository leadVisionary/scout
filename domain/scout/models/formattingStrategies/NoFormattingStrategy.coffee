FormattingStrategy = require './FormattingStrategy.coffee'

class NoFormattingStrategy extends FormattingStrategy
  applyFormat: (data) -> data

module.exports = NoFormattingStrategy
