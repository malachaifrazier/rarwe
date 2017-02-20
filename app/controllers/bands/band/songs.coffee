import Ember from 'ember'

BandsBandSongsController = Ember.Controller.extend(
  songCreationStarted: false

  canCreateSong: Ember.computed 'songCreationStarted', 'model.songs.length', ->
    return @get('songCreationStarted') || @get('model.songs.length')

  actions: {
    enableSongCreation: ->
      @set("songCreationStarted", true)
      false

    updateRating: (params) ->
      console.log("BandsBandSongsController#updateRating")
      song   = params.item
      rating = params.rating
      if song.get('rating') == rating
        rating = 0
      song.set('rating', rating)
      song.save()
  }
)
export default BandsBandSongsController
