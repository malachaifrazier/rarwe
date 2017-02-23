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
    @get('model.songs').filter (song) =>
      song.get('title').toLowerCase().indexOf(searchTerm) != -1

  isAddButtonDisabled: Ember.computed.empty('title')
  hasSongs:            Ember.computed.bool('model.songs.length')
  canCreateSong:       Ember.computed.or('songCreationStarted', 'hasSongs')

  # canCreateSong: Ember.computed 'songCreationStarted', 'model.songs.length', ->
  #   @get('songCreationStarted') || @get('model.songs.length')

  sortedSongs: Ember.computed.sort('matchingSongs', 'sortProperties')
  # Disable sorting
  # sortedSongs: Ember.computed.alias('matchingSongs')

  actions:
    enableSongCreation: ->
      @set("songCreationStarted", true)
      return false

    updateRating: (params) ->
      { item: song, rating } = params
      if song.get('rating') == rating
        rating = null
      song.set('rating', rating)
      song.save()

export default BandsBandSongsController
