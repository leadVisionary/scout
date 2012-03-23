FormattingStrategy = require './FormattingStrategy.coffee'

class NoTransformation extends FormattingStrategy
  applyFormat: (data) -> data

module.exports = NoTransformation
