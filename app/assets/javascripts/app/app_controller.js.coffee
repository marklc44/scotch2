AppCtrls = angular.module "AppCtrls", []

class AppCtrl

  constructor: (@scope, @http) ->
    @whiskies = []

  allWhisky = =>
    @http.get("/whiskies").success (data) =>
      console.log(data)

  allWhisky()

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