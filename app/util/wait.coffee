import Ember from 'ember'

wait = (value, delay) ->
  promise = value.then && typeof value.then == 'function' ? value : Ember.RSVP.resolve(value)

  new Ember.RSVP.Promise (resolve) ->
    setTimeout () ->
      promise.then (result) ->
        resolve(result)
    , delay

export default wait
