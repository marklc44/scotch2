// Generated by CoffeeScript 1.8.0
var RegionsCtrl;

RegionsCtrl = (function() {
  function RegionsCtrl(scope, Region) {
    this.scope = scope;
    this.Region = Region;
    this.scope.regions = [];
    this.Region.query("/regions", (function(_this) {
      return function(data) {
        return _this.scope.regions = data;
      };
    })(this));
  }

  return RegionsCtrl;

})();

AppCtrls.controller("RegionsCtrl", ["$scope", "Region", RegionsCtrl]);
