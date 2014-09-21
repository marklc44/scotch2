AppRouter = angular.module "AppRouter", [
  "ngRoute",
  "ngResource"
]

class Router

  constructor: (@routeProvider, @locationProvider) ->
    console.log("Initialized Router")
    console.log("Setting Up")
    @routeProvider
      .when "/",
        templateUrl: "/sites_templates",
        controller: "AppCtrl as app"

    @locationProvider.html5Mode(true)

AppRouter.config ["$routeProvider", "$locationProvider", Router]

AppRouter.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]