import Ember from 'ember'
import { capitalizeWords as capitalize } from 'rarwe/helpers/capitalize-words'

BandsBandSongsController = Ember.Controller.extend
  queryParams: {
    sortBy: 'sort',
    searchTerm: 's',
  }

  songCreationStarted: false
  sortBy: 'ratingDesc'
  searchTerm: ''

  newSongPlaceholder: Ember.computed 'model.name', () ->
    bandName = @get('model.name')
    "New #{capitalize(bandName)} song"

  sortProperties: Ember.computed 'sortBy', ->
    options = {
    'ratingDesc': 'rating:desc,title:asc',
    'ratingAsc': 'rating:asc,title:asc',
    'titleDesc': 'title:desc',
    'titleAsc': 'title:asc',
    }
    options[@get('sortBy')].split(',')

  matchingSongs: Ember.computed 'model.songs.@each.title', 'searchTerm', ->
    searchTerm = @get('searchTerm').toLowerCase()
    @get('model.songs').filter (song) ->
      song.get('title').toLowerCase().indexOf(searchTerm) != -1

  sortedSongs: Ember.computed.sort('matchingSongs', 'sortProperties')

  canCreateSong: Ember.computed 'songCreationStarted', 'model.songs.length', ->
    return @get('songCreationStarted') || @get('model.songs.length')

  actions:
    enableSongCreation: ->
      @set("songCreationStarted", true)
      false

    updateRating: (params) ->
      alert("BandsBandSongsController#updateRating")
      song   = params.item
      rating = params.rating
      if song.get('rating') == rating
        rating = 0
      song.set('rating', rating)
      song.save()

export default BandsBandSongsController
