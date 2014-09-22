AppFilters = angular.module "AppFilters", []

AppFilters.filter "offset", () ->
  return (input, start) ->
    start = parseInt(start, 10)
    return input.slice(start)