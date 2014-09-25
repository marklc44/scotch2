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
AppFactories.factory "RegionsWhiskies", ["$resource", ($resource) ->
  return $resource "/regions/:id/whiskies.json"

]

AppFactories.factory "RegionsProducers", ["$resource", ($resource) ->
  return $resource "/regions/:region_id/producers/:id.json"

]
AppFactories.factory "RegionsProducersWhiskies", ["$resource", ($resource) ->
  return $resource "/regions/:region_id/producers/:producer_id/whiskies/:id.json"

]
AppFactories.factory "Deals", ["$resource", ($resource) ->
  return $resource "/deals/:brand.json"
]
