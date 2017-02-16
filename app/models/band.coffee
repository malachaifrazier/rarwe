# import Ember from 'ember'
import DS from 'ember-data'

Band = DS.Model.extend(
  name:        DS.attr('string'),
  description: DS.attr(''),
  songs:       DS.hasMany('song'),

  # slug: Ember.computed 'name', ->
  #   @get('name').dasherize()

  # setupSongs: Ember.on 'init', ->
  #   if !@get('songs')
  #     @set('songs', [])
)

export default Band
