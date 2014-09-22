# flavor search controllers
class FlavorSearchCtrl
  constructor: (@scope, @Producer) ->
    # get search params

    # send to server
    # query flavor_profiles for producers
    # and get back all of those
    # producers' whiskies
      # give whisky results to ResultsCtrl or ResultsDirective
      # to display in the list




AppCtrls.controller "FlavorSearchCtrl", ["$scope", "Producer", FlavorSearchCtrl]