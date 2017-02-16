import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend
  location: config.locationType,
  rootURL: config.rootURL

Router.map ->
  @route 'bands', ->
    @route 'band', {path: ':id'}, ->
      @route 'songs'
      @route 'details'
  # @route 'bands/band/index'

export default Router
