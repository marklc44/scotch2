

class ResultsCtrl

  constructor: (@scope, @Whisky, @RegionsWhiskies) ->
    @whiskies = []
    @showRegionDesc = []
    @sortBy = '-rating'
    @showChart = false

    # pagination
    @currentPage = 1
    @offset = 0

    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data

  # call getWhiskies when filtering or sorting the results
  # to get results not included in the limitTo
  getAllWhiskies: =>
    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data

  getRegionWhiskies: (region_id) =>
    console.log "region clicked"
    @RegionsWhiskies.query {id: region_id}, (data) =>
      console.log "region-whiskies", data
      @showRegionDescModal(region_id)
      @whiskies = data

  showRegionDescModal: (region_id) =>
    @showRegionDesc =[]
    @showRegionDesc[region_id] = true
    console.log @showRegionDesc

  hideRegionDescModal: () =>
    @showRegionDesc = []

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
      console.log data
      @whisky = data


AppCtrls.controller "ResultsCtrl", ["$scope", "Whisky", "Region", "RegionsWhiskies", ResultsCtrl]
# saved this as example of how to add another controller
AppCtrls.controller "ShowWhiskyCtrl", ["$scope", "Whisky", "$routeParams", ShowWhiskyCtrl]