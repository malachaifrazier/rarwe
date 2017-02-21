# import Ember from 'ember'
import DS from 'ember-data'

Band = DS.Model.extend
  name:        DS.attr('string'),
  description: DS.attr(''),
  songs:       DS.hasMany('song'),

export default Band
