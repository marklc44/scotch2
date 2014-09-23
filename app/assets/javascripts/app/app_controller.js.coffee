

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
      @scope.whiskies = data

  # call getWhiskies when filtering or sorting the results
  # to get results not included in the limitTo
  getAllWhiskies: =>
    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data
      @scope.whiskies = data

  getRegionWhiskies: (region_id) =>
    console.log "region clicked"
    @RegionsWhiskies.query {id: region_id}, (data) =>

      @showRegionDescModal(region_id)
      @whiskies = data
      @scope.whiskies = data
      console.log "scope after region whiskies", @scope.whiskies

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



class ShowWhiskyCtrl

  constructor: (@scope, @Whisky, routeParams) ->
    console.log "whisky controller loaded"
    @scope.whisky = {}
    @id = routeParams.id

    @Whisky.get {id: @id}, (data) =>
      console.log data
      @scope.whisky = data


class ShowProducerCtrl

  constructor: (@scope, @Producer, routeParams) ->
    console.log "producer controller loaded"
    @scope.producer = {}
    @id = routeParams.id

    @Producer.get {id: @id}, (data) =>
      console.log "producer", data
      @scope.producer = data

AppCtrls.controller "ResultsCtrl", ["$scope", "Whisky", "Region", "RegionsWhiskies", ResultsCtrl]
# saved this as example of how to add another controller
AppCtrls.controller "ShowWhiskyCtrl", ["$scope", "Whisky", "$routeParams", ShowWhiskyCtrl]

AppCtrls.controller "ShowProducerCtrl", ["scope", "Producer", "$routeParams", ShowProducerCtrl]










