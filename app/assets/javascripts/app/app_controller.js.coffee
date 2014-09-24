

class ResultsCtrl

  constructor: (@scope, @Whisky, @RegionsWhiskies) ->
    @whiskies = []
    @showRegionDesc = []
    @sortBy = '-rating'
    @showChart = false

    # pagination
    @currentPage = 0
    @scope.totalItems = @whiskies.length
    # @scope.currentPage = 1

    @scope.maxSize = 10;
    # @scope.bigTotalItems = 175;
    # @scope.bigCurrentPage = 1;

    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data
      @scope.whiskies = data
      @visibleWhiskies = data

  # call getWhiskies when filtering or sorting the results
  # to get results not included in the limitTo
  getAllWhiskies: =>
    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data
      @scope.whiskies = data
      @visibleWhiskies = data

  getRegionWhiskies: (region_id) =>
    console.log "region clicked"
    @RegionsWhiskies.query {id: region_id}, (data) =>

      @showRegionDescModal(region_id)
      @whiskies = data
      @scope.whiskies = data
      @visibleWhiskies = data

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
    @scope.currentPage = pageNo
    @setOffset()

  setOffset: =>
    thisPage = @currentPage - 1
    @visibleWhiskies = @whiskies.slice(thisPage * 10, thisPage * 10 + 10)



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
    @flavorData = {}
    @flavorNums = []
    @flavorNumObjs = []

    @Producer.get {id: @id}, (data) =>
      console.log "producer", data
      @scope.producer = data
      @flavorData = data.flavor_profile
      # @filterFlavors()
      # console.log @flavorNums

  filterFlavors: () =>
    # filter and sort flavor data
    excludes = ["broad_keyword1", "broad_keyword2", "id", "created_at", "updated_at", "flavored_id", "flavored_type"]
    for key of @flavorData
      obj = []
      if excludes.indexOf(key) == -1 && @flavorData[key] != 0
        obj.push(key)
        obj.push(@flavorData[key])
        @flavorNums.push(obj)

    @flavorNums.sort (a, b) =>
      a[1] - b[1]
    console.log @flavorNums




AppCtrls.controller "ResultsCtrl", ["$scope", "Whisky", "Region", "RegionsWhiskies", ResultsCtrl]
# saved this as example of how to add another controller
AppCtrls.controller "ShowWhiskyCtrl", ["$scope", "Whisky", "$routeParams", ShowWhiskyCtrl]

AppCtrls.controller "ShowProducerCtrl", ["$scope", "Producer", "$routeParams", ShowProducerCtrl]










