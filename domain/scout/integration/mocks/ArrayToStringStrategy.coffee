FormattingStrategy = require '../../models/FormattingStrategy'

class ArrayToStringStrategy extends FormattingStrategy
  applyFormat: (data) ->
    data.join()

module.exports = ArrayToStringStrategy
