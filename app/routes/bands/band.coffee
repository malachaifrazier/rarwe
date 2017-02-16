import Ember from 'ember'

BandsBandRoute = Ember.Route.extend(
  model: (params) ->
    @store.findRecord('band', params.id)
    # bands = @modelFor('bands')
    # return bands.findBy('slug', params.slug)
)

export default BandsBandRoute
