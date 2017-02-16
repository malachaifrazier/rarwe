import Ember from 'ember'

BandsBandSongsController = Ember.Controller.extend(
  songCreationStarted: false

  canCreateSong: Ember.computed 'songCreationStarted', 'model.songs.length', ->
    return @get('songCreationStarted') || @get('model.songs.length')

  actions: {
    enableSongCreation: ->
      return @set('songCreationStarted', true)

    updateRating: (params) ->
      debugger
      song   = params.item
      rating = params.rating
      song.set('rating', rating)
  }
)
export default BandsBandSongsController
