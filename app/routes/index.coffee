import Ember from 'ember'

IndexRoute = Ember.Route.extend(
  beforeModel: ->
    @transitionTo('bands')
)

export default IndexRoute
