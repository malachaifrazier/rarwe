import Ember from 'ember'
# import Band from '../models/band'
# import Song from '../models/song'

BandsRoute = Ember.Route.extend(
  model: ->
    @store.findAll('band')

    # blackDog = Song.create
    #   title: 'Black Dog',
    #   band: 'Led Zeppelin',
    #   rating: 3

    # yellowLedbetter = Song.create
    #   title: 'Yellow Ledbetter',
    #   band: 'Pearl Jam',
    #   rating: 4

    # pretender = Song.create
    #   title: 'The Pretender',
    #   band: 'Foo Fighters',
    #   rating: 2

    # ledZeppelin = Band.create
    #   name: 'Led Zeppelin',
    #   songs: [blackDog],

    # pearlJam = Band.create
    #   name: 'Pearl Jam',
    #   description: 'Pearl Jam is an American rock band, formed in Seattle, Washington in 1990.',
    #   songs: [yellowLedbetter],

    # fooFighters = Band.create
    #   name: 'Foo Fighters',
    #   songs: [pretender],

    # [ledZeppelin, pearlJam, fooFighters]

  actions: {
    didTransition: ->
      document.title = 'Bands - Rock & Roll'

    createBand: ->
      controller = @get('controller')

      band = @store.createRecord('band', controller.getProperties('name'))
      band.save.then ->
        controller.set('name', '')
        @transitionTo('bands.band.songs', band)
  }
)

export default BandsRoute
