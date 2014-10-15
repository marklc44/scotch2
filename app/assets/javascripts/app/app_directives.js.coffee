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


ScotchApp.directive "radarChart", () ->
      return {
      restrict: "E",
      scope: {
            chartTitle: '@chartTitle',
            data: '=chartData'
      },
      templateUrl: "/templates/radar_chart.html",
      link: (scope, element, attrs) ->
            console.log "radar chart directive loaded"
            console.log "chart scope", attrs
            excludes = ["broad_keyword1", "broad_keyword2", "id", "created_at", "updated_at", "flavored_id", "flavored_type"]

            attrs.$observe "chartdata", (value) ->
                  console.log "watched data", angular.fromJson value
                  rawData = angular.fromJson value
                  labels = []
                  data = []

                  colors = {
                        ebony: "34, 49, 63",
                        burntOrange: "211, 84, 0"
                  }

                  # create initial arrays
                  rawData.forEach (item) ->
                        labels.push item[0]
                        data.push item[1]
                  # construct options
                  # construct cData object
                  cData = {
                        labels: labels,
                        datasets:[{
                              label: "My First dataset",
                              fillColor: "rgba(" + colors.ebony + ",0.4)",
                              strokeColor: "rgba(" + colors.burntOrange + ",1)",
                              pointColor: "rgba(220,220,220,1)",
                              pointStrokeColor: "rgba(" + colors.burntOrange + ",1)",
                              pointHighlightFill: "#fff",
                              pointHighlightStroke: "rgba(220,220,220,1)",
                              data: data
                        }]

                  }

                  # build chart
                  console.log cData
                  tplChildren = element.children()
                  window.kids = tplChildren
                  ctx = tplChildren[2].getContext('2d')
                  flavorRadarChart = new Chart(ctx).Radar(cData)

                  # add title
                  # tplChildren[0].innerHTML = attrs.charttitle

            attrs.$observe "charttitle", (value) ->
                  element.children()[0].innerHTML = value
      }

# ScotchApp.directive "showRegionDesc", () ->
#   return {
#     restrict: "A",
#     scope: {
#       region: "="
#       },
#     templateUrl: "templates/region_modal.html"

#   }




















