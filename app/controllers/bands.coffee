import Ember from 'ember'

BandsController = Ember.Controller.extend
  name: ''

  isAddButtonDisabled: Ember.computed.empty('name') #Ember.computed 'name', ->
    # return Ember.isEmpty @get('name')

export default BandsController
