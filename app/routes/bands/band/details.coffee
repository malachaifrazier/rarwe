import Ember from 'ember'

BandsBandDetailsRoute = Ember.Route.extend(
  # model: ->
  #   return @modelFor('bands.band')

  actions: {
    edit: ->
      @set('isEditing', true)

    save: ->
      @set('isEditing', false)

    willTransition: (transition) ->
      leave      = ''
      controller = @get('controller')

      if controller.get('isEditing')
        leave = window.confirm("You have unsaved changes. Are you sure you want to leave?")
        if leave
          controller.set('isEditing', false)
        else
          transition.abort()
  }
)

export default BandsBandDetailsRoute
