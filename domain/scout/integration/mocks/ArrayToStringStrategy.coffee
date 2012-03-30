FormattingStrategy = require '../../models/formattingStrategies/FormattingStrategy'

class ArrayToStringStrategy extends FormattingStrategy
  applyFormat: (data) ->
    data.join()

module.exports = ArrayToStringStrategy
