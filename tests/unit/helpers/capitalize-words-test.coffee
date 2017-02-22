import { capitalizeWords as capitalize } from 'rarwe/helpers/capitalize-words'
import { module, test } from 'qunit'

module 'Unit | Helper | capitalize'

# Replace this with your real tests.
test 'it works', (assert) ->
  result = capitalize "test there is"
  assert.ok result
