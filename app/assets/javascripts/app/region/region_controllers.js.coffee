# region controllers
class RegionsCtrl
  constructor: (@scope, @Region, @RegionsProducers, @RegionsProducersWhiskies) ->
    @scope.regions = []

    @Region.query "/regions", (data) =>
      @scope.regions = data


AppCtrls.controller "RegionsCtrl", ["$scope", "Region", "RegionsProducers", "RegionsProducersWhiskies", RegionsCtrl]