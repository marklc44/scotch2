AppFilters = angular.module "AppFilters", []

AppFilters.filter "offset", () ->
  return (input, start) ->
    start = parseInt(start, 10)
    return input.slice(start)

AppFilters.filter "filterNullPrice", () ->
  return  (input, start) ->
    console.log "filter called", input
    input.filter (item) -> item.offers_total != 0