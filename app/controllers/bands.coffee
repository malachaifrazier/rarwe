import Ember from 'ember'
# import { capitalize } from 'rarwe/helpers/capitalize'

BandsController = Ember.Controller.extend
  name: ''

  isAddButtonDisabled: Ember.computed 'name', ->
    return Ember.isEmpty @get('name')

export default BandsController
