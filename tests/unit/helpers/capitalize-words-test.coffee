import { capitalizeWords as capitalize } from 'rarwe/helpers/capitalize-words'
import { module, test } from 'qunit'

module 'Unit | Helper | capitalize'

# Replace this with your real tests.
test 'it works', (assert) ->
  string            = "test there is"
  capitalizedString = capitalize(string)
  assert.equal capitalizedString, "Test There Is"
