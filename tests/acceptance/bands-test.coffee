import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'rarwe/tests/helpers/start-app'
import Pretender from 'pretender'
import httpStubs from '../helpers/http-stubs'

module 'Acceptance: Bands',
  beforeEach: ->
    @application = startApp()
    return

  afterEach: ->
    server.shutdown()
    Ember.run @application, 'destroy'

server = null

test 'list bands', (assert) ->
  server = new Pretender ->
    @get '/bands', ->
      response = {
        data: [
          {
            id: 1,
            type: 'bands',
            attributes: {
              name: 'Radiohead'
            }
          },
          {
            id: 2,
            type: 'bands',
            attributes: {
              name: 'Long Distance Calling'
            }
          }
        ]
      }
      [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

  visit '/bands'
  andThen ->
    assertLength assert, '.band-link', 2, 'All band links are rendered'
    assertLength assert, '.band-link:contains("Radiohead")', 1, 'First band link contains the band name'
    assertLength assert, '.band-link:contains("Long Distance Calling")', 1, 'The other band link contains the band name'

test 'create a new band', (assert) ->
  server = new Pretender () ->
    # @get '/bands', ->
    #   response = {
    #     data: [
    #       {
    #         id: 1,
    #         type: 'bands',
    #         attributes: {
    #           name: 'Radiohead'
    #         }
    #       }
    #     ]
    #   }
    #   [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    # @post '/bands', ->
    #   response = {
    #     data: {
    #       id: 2,
    #       type: 'bands',
    #       attributes: {
    #         name: 'Long Distance Calling'
    #       }
    #     }
    #   }
    #   [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    # @get '/bands/2/songs', ->
    #   response = {
    #     data: []
    #   }
    #   [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    httpStubs.stubBands(@, [
      {
        id: 1,
        attributes: {
          name: 'Radiohead'
        }
      }
    ])
    httpStubs.stubCreateBand(@, 2)
    httpStubs.stubSongs(@, 2, [])

    visit '/bands'
    fillIn '.new-band', 'Long Distance Calling'
    click '.new-band-button'

    andThen ->
      assertLength assert, '.band-link', 2, 'All band links are rendered'
      assertTrimmedText assert, '.band-link:last', 'Long Distance Calling', 'Created band appears at the end of the list'
      assertElement assert, '.nav a.active:contains("Songs")', 'The Songs tab is active'

test 'create a new song in two steps', (assert) ->
  server = new Pretender ->
    @get '/bands', ->
      response = {
        data: [
          {
            id: 1,
            type: 'bands',
            attributes: {
              name: 'Radiohead'
            }
          }
        ]
      }
      [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    @get '/bands', ->
      response = {
        data: {
          id: 1,
          type: 'bands',
          attributes: {
            name: 'Radiohead'
          }
        }
      }
      [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    @post '/songs', ->
      response = {
        data: {
          id: 2,
          type: 'songs',
          attributes: {
            name: 'Killer Cars'
          }
        }
      }
      [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify(response)]

    @get '/bands/1/songs', =>
      [200, { 'Content-Type': 'application/vnd.api+json' }, JSON.stringify({ data: [] })]

    selectBand 'Radiohead'
    click 'a:contains("create one")'
    fillIn '.new-song', 'Killer Cars'
    submit '.new-song-form'

    andThen ->
      assertElement(assert, '.songs .song:contains("Killer Cars")', 'Creates the song and displays it in the list');

