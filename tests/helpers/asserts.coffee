import Ember from 'ember'

assertTrimmedText = (app, assert, selector, text, errorMessage) ->
  element     = findWithAssert(selector)
  elementText = element.text().trim()
  assert.equal elementText, text, errorMessage

assertLength = (app, assert, selector, length, errorMessage) ->
  assert.equal find(selector).length, length, errorMessage

assertElement = (app, assert, selector, errorMessage) ->
  assert.equal find(selector).length, 1, errorMessage

Ember.Test.registerHelper 'assertTrimmedText', assertTrimmedText
Ember.Test.registerHelper 'assertLength', assertLength
Ember.Test.registerHelper 'assertElement', assertElement
