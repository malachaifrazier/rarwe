import Ember from 'ember'

BandsBandIndexRoute = Ember.Route.extend(
  afterModel: (band) ->
    description = band.get('description')

    if Ember.isEmpty(description)
      @transitionTo('bands.band.songs')
    else
      @transitionTo('bands.band.details')
)

export default BandsBandIndexRoute
