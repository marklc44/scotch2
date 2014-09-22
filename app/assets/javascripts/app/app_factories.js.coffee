AppFactories = angular.module "AppFactories", ["ngResource"]

# Crud Factories for primary resources

AppFactories.factory "Whisky", ["$resource", ($resource) ->
  return $resource "/whiskies/:id.json"
]

AppFactories.factory "Producer", ["$resource", ($resource) ->
  return $resource "/producers/:id.json"
]

AppFactories.factory "Region", ["$resource", ($resource) ->
  return $resource "/regions/:id.json"
]
