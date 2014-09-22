AppCtrls = angular.module "AppCtrls", []

class ResultsCtrl

  constructor: (@scope, @Whisky) ->
    @whiskies = []
    @sortBy = '-rating'

    # pagination
    @currentPage = 1
    @offset = 0

    console.log(@sortBy.price)

    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data

  # call getWhiskies when filtering or sorting the results
  # to get results not included in the limitTo
  getAllWhiskies: =>
    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data

  # pagination
  setPage: (pageNo) =>
    console.log pageNo
    @currentPage = pageNo
    @setOffset()

  setOffset: =>
    @offset = @currentPage * 10

# saved comments as a template for creating the
# next controller
class ShowWhiskyCtrl

  constructor: (@scope, @Whisky, routeParams) ->
    @whisky = {}
    @id = routeParams.id

    @Whisky.get {id: @id}, (data) =>
      @whisky = data


AppCtrls.controller "ResultsCtrl", ["$scope", "Whisky", ResultsCtrl]
# saved this as example of how to add another controller
AppCtrls.controller "ShowWhiskyCtrl", ["$scope", "Whisky", "$routeParams", ShowWhiskyCtrl]