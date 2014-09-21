AppCtrls = angular.module "AppCtrls", []

class AppCtrl

  constructor: (@scope, @http) ->
    @whiskies = []
    @greeting = "Hello World"
    console.log("AppCtrl working")
    console.log(@http)

    @http.get("/whiskies.json").success (data) =>
      console.log(data)
      @whiskies = data



# saved comments as a template for creating the
# next controller
# class ShowWordCtrl

#   constructor: (@scope, @Word, routeParams) ->
#     @word = ''
#     @id = routeParams.id

#     @Word.get {id: @id}, (data) =>
#       @word = data


AppCtrls.controller "AppCtrl", ["$scope", "$http", AppCtrl]
# saved this as example of how to add another controller
# AppCtrls.controller "ShowWordCtrl", ["$scope", "Word", "$routeParams", ShowWordCtrl]