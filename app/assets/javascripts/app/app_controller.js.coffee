

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

    @Whisky.query (data) =>
      console.log(data)
      @whiskies = data
      @scope.whiskies = data
      @visibleWhiskies = data

  getAllWhiskies: =>
    @sortBy = '-rating'
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

  # sorting
  toggleSort: (cat) =>
    console.log "sortby before", @sortBy
    if @sortBy.split('')[0] == '-'
      console.log @sortBy.split('')[0]
      @sortBy = cat
      console.log "sortby after", @sortBy
    else
      @sortBy = '-' + cat
      console.log "sortby after", @sortBy


class ShowWhiskyCtrl

  constructor: (@scope, @Whisky, @Deals, routeParams) ->
    console.log "whisky controller loaded"
    @scope.whisky = {}
    @scope.deals = []
    @id = routeParams.id
    console.log @id
    @Whisky.get {id: @id}, (data) =>
      console.log data
      @scope.whisky = data
      @Deals.get {brand: @scope.whisky.producer.name}, (data) =>
        console.log data.results
        @scope.deals = data.results

  filterNullPrice: (deal) ->
    console.log "filter called"



class ShowProducerCtrl

  constructor: (@scope, @Producer, @Similar, routeParams) ->
    console.log "producer controller loaded"
    @scope.producer = {}
    @id = routeParams.id
    @flavorData = {}
    @scope.producer.whiskies = []

    @flavorNums = []
    @scope.flavorNums = []
    @scope.similarFlavors = []

    # pagination
    @scope.currentPage = 1
    @scope.totalItems = @scope.producer.whiskies.length
    @scope.maxSize = 10;

    @Producer.get {id: @id}, (data) =>
      console.log "producer", data
      @scope.producer = data
      @scope.totalItems = @scope.producer.whiskies.length
      @scope.visibleWhiskies = @scope.producer.whiskies
      @flavorData = data.flavor_profile
      @filterFlavors()

    # why doesn't angular recognize the returned array?
    @Similar.query {id: @id}, (data) =>
      @scope.similarFlavors = data
      console.log "similar data", @scope.similarFlavors

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

    @scope.flavorNums = @flavorNums


  # pagination
  setPage: (pageNo) =>
    console.log "page set"
    @scope.currentPage = pageNo
    @setOffset()

  setOffset: =>
    console.log "setting page"
    thisPage = @scope.currentPage - 1
    @scope.visibleWhiskies = @scope.producer.whiskies.slice(thisPage * 10, thisPage * 10 + 10)


class SessionsCtrl
  constructor: (@scope, @http, @rootScope, @locationProvider) ->

  addSession: (loginUser) =>
    @http.post "/login.json", {user: loginUser}
      .success (user) ->
        @rootScope.current_user = user
        # check redirect
        @locationProvider.redirect('/')
      .error (errors) ->
        alert "invalid email or password"

class MainCtrl
  constructor: (@scope, @http, @rootScope) ->


AppCtrls.controller "ResultsCtrl", ["$scope", "Whisky", "Region", "RegionsWhiskies", ResultsCtrl]
# saved this as example of how to add another controller
AppCtrls.controller "ShowWhiskyCtrl", ["$scope", "Whisky", "Deals", "$routeParams", ShowWhiskyCtrl]

AppCtrls.controller "ShowProducerCtrl", ["$scope", "Producer", "Similar", "$routeParams", ShowProducerCtrl]

AppCtrls.controller "SessionsCtrl", ["$scope", "$http", "$rootScope", "$locationProvder", SessionsCtrl]

AppCtrls.controller "MainCtrl", ["$scope", "$http", "$rootScope", MainCtrl]








