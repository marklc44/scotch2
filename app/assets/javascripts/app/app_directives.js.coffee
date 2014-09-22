# ScotchApp.directive "ResultsDirective", () ->
#   return {
#     restrict: "A",
#     scope: "=",
#     link: ($scope, el, attrs) ->
#       console.log $scope
#     ,
#     templateUrl: "/sites_templates/index.html",
#     controller: "AppCtrl"
#   }



ScotchApp.directive "search-directive", () ->
  return {
    restrict: "A",
    scope: true,
    template: "<h2>Hello {{results.currentPage}}</h2>"

  }

