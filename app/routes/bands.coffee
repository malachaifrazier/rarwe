import Ember from 'ember'

BandsRoute = Ember.Route.extend
  model: ->
    @store.findAll('band')

  actions:
    didTransition: ->
      document.title = 'Bands - Rock & Roll'

    createBand: ->
      controller = @get('controller')
      route      = @

      band = @store.createRecord('band', controller.getProperties('name'))
      band.save().then ->
        controller.set('name', '')
        route.transitionTo('bands.band.songs', band)

export default BandsRoute
