import Ember from 'ember'

BandsBandRoute = Ember.Route.extend
  model: (params) ->
    @store.findRecord('band', params.id)

export default BandsBandRoute
