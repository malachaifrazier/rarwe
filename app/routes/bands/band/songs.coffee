import Ember from 'ember'
import { capitalizeWords as capitalize } from 'rarwe/helpers/capitalize-words'

BandsBandSongsRoute = Ember.Route.extend
  model: ->
    # Ember.RSVP.reject(@modelFor('bands.band'))
    @modelFor('bands.band')

  resetController: (controller) ->
    controller.set('songCreationStarted', false)

  actions:
    didTransition: ->
      band = @modelFor('bands.band')
      document.title = "#{band.get('name')} songs - Rock & Roll"
      name           = capitalize band.get('name')
      document.title = "#{name} songs - Rock & Roll"

    createSong: ->
      controller = @get('controller')
      band       = @modelFor('bands.band')

      song = @store.createRecord('song', {
          title: controller.get('title'),
          band: band,
          rating: 0
        }
      )
      song.save().then ->
        controller.set('title', '')

export default BandsBandSongsRoute
