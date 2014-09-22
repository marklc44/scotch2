# region controllers
class RegionsCtrl
  constructor: (@scope, @Region) ->
    @scope.regions = []

    @Region.query "/regions", (data) =>
      @scope.regions = data


AppCtrls.controller "RegionsCtrl", ["$scope", "Region", RegionsCtrl]