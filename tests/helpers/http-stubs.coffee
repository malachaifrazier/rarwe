songsUrlForBand = (id) ->
  '/bands/' + id + '/songs'

responseItemForBand = (data, id) ->
  bandId = id || data.id
  return {
    id: bandId,
    type: 'bands',
    attributes: data.attributes,
    relationships: {
      songs: {
        links: {
          related: songsUrlForBand(bandId)
        }
      }
    }
  }

responseItemForSong = (data, id) ->
  songId = id || data.id
  return {
    id: songId,
    type: 'songs',
    attributes: data.attributes
  }

export default {
  stubBands: (pretender, data) ->
    responseForBands = []

    data.forEach (band) ->
      responseForBand = responseItemForBand(band)
      pretender.get '/bands/' + responseForBand.id, () ->
        [200, {'Content-Type': 'application/vnd.api+json'}, JSON.stringify({ data: responseForBand }) ]
      responseForBands.push(responseForBand)

    pretender.get '/bands', () ->
      [200, {'Content-Type': 'application/vnd.api+json'}, JSON.stringify({ data: responseForBands }) ]

  stubSongs: (pretender, bandId, data) ->
    response = data.map (song) ->
      responseItemForSong(song)

    pretender.get songsUrlForBand(bandId), () ->
      [200, {'Content-Type': 'application/vnd.api+json'}, JSON.stringify({ data: response }) ]

  stubCreateBand: (pretender, newId) ->
    pretender.post '/bands', (request) ->
      response = responseItemForBand(JSON.parse(request.requestBody), newId)
      [200, {'Content-Type': 'application/vnd.api+json'}, JSON.stringify({ data: response }) ]

  stubCreateSong: (pretender, newId) ->
    pretender.post '/songs', (request) ->
      response = responseItemForSong(JSON.parse(request.requestBody), newId)
      [200, {'Content-Type': 'application/vnd.api+json'}, JSON.stringify({ data: response }) ]
}
