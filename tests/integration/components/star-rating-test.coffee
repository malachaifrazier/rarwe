import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'star-rating', 'Integration | Component | star rating', {
  integration: true
}

test 'Renders the full and empty stars correctly', (assert) ->
  assert.expect 6

  song = Ember.Object.create(rating: 4)
  @set 'song', song
  @set 'maxRating', 5

  @render hbs """{{star-rating item=song rating=song.rating maxRating=maxRating}}"""

  assert.equal @$('.glyphicon-star').length, 4, 'The right amount of full stars is rendered'
  assert.equal @$('.glyphicon-star-empty').length, 1, 'The right amount of empty stars is rendered'
  @set 'maxRating', 10

  assert.equal @$('.glyphicon-star').length, 4, 'The right amount of full stars is rendered after changing maxRating'
  assert.equal @$('.glyphicon-star-empty').length, 6, 'The right amount of empty stars is rendered after changing maxRating'

  @set 'song.rating', 2
  assert.equal @$('.glyphicon-star').length, 2, 'The right amount of full stars is rendered after changing rating'

  assert.equal @$('.glyphicon-star-empty').length, 8, 'The right amount of empty stars is rendered after changing rating'
