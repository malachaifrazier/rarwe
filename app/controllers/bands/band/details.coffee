import Ember from 'ember'

BandsBandDetailsController = Ember.Controller.extend(
  isEditing: false

  actions: {
    edit: ->
      @set('isEditing', true)

    save: ->
      @set('isEditing', false)
      return true
  }
)

export default BandsBandDetailsController
