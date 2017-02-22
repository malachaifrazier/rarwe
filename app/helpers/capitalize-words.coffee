import Ember from 'ember'

# This function receives the params `params, hash`

export capitalizeWords = (input) ->
  words = input.toString().split(/\s+/).map (word) ->
    word.toLowerCase().capitalize()
  words.join(' ') if words?

export default Ember.Helper.helper capitalizeWords
