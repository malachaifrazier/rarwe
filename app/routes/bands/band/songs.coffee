import Ember from 'ember'
# import Song from '../../../models/song'

BandsBandSongsRoute = Ember.Route.extend(
  model: ->
    @modelFor('bands.band')

  resetController: (controller) ->
    controller.set('songCreationStarted', false)

  actions: {
    didTransition: ->
      band = @modelFor('bands.band')
      document.title = "#{band.get('name')} songs - Rock & Roll"

    createSong: ->
      controller = @get('controller')
      band       = @modelFor('bands.band')

      song = @store.createRecord('song',
        title: controller.getProperties('title'),
        band: band
      )

      song.save().then ->
        controller.set('title', '')
  }
)

export default BandsBandSongsRoute
