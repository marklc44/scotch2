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
        templateUrl: "/whisky_templates",
        controller: "ResultsCtrl as results"
      .when "/whiskies/:id",
        templateUrl: "/whisky_templates/show",
        contoller: "ShowWhiskyCtrl as whisky"
      .when "/producers/:id",
        templateUrl: "/producer_templates/show.html",
        controller: "ShowProducerCtrl as producer"
    # .otherwise
    #   redirectTo: "/"

    @locationProvider.html5Mode(true)

AppRouter.config ["$routeProvider", "$locationProvider", Router]

AppRouter.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]