import Ember from 'ember'

selectBand = (app, name) ->
  visit('/')
  click('.band-link:contains("' + name + '")')
  app.testHelpers.wait()

submit = (app, selector) ->
  triggerEvent(selector, 'submit')

Ember.Test.registerAsyncHelper('selectBand', selectBand)
Ember.Test.registerAsyncHelper('submit', submit)
