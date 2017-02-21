import Ember from 'ember'

Song = Ember.Object.extend
  title: '',
  band: '',
  rating: 0

SongsRoute = Ember.Route.extend
  model: ->
    blackDog = Song.create
      title: 'Black Dog',
      band: 'Led Zeppelin',
      rating: 3

    yellowLedbetter = Song.create
      title: 'Yellow Ledbetter',
      band: 'Pearl Jam',
      rating: 4

    pretender = Song.create
      title: 'The Pretender',
      band: 'Foo Fighters',
      rating: 2

    [blackDog, yellowLedbetter, pretender]

export default SongsRoute
