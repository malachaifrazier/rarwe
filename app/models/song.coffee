# import Ember from 'ember'
import DS from 'ember-data'

Song = DS.Model.extend(
  title: DS.attr('string'),
  rating: DS.attr('number'),
  band: DS.belongsTo('band'),
)

export default Song
