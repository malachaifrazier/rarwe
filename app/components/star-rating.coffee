import Ember from 'ember'

StarRatingComponent = Ember.Component.extend
  tagName:    'div',
  classNames: ['rating-panel'],
  rating:     0,
  maxRating:  5,
  item:       null,
  "on-click": null

  stars: Ember.computed 'rating', 'maxRating', ->
    fullStars  = @starRange(1, @get('rating'), 'full')
    emptyStars = @starRange(@get('rating') + 1, @get('maxRating'), 'empty')
    fullStars.concat(emptyStars)

  starRange: (start, end, type) ->
    starsData = []
    i = start
    while i <= end
      starsData.push
        rating: i
        full: type == 'full'
      i++
    starsData
    # starsData = []
    # starsData.push(rating: i, full: (type == 'full')) for start, i in [start, end]
    # return starsData

  actions:
    setRating: (newRating) ->
      console.log("on-click here in StarRatingComponent setRating action")
      @get "on-click",
        item: @get("item")
        rating: newRating

export default StarRatingComponent
