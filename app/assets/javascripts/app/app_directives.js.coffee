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


ScotchApp.directive "showRegionDesc", () ->
  return {
    restrict: "A",
    scope: {
      region: "="
      },
    templateUrl: "templates/region_modal.html"

  }

ScotchApp.directive "radarChart", () ->
      return {
      restrict: "E",
      scope: {
            name: '@currentProducer',
            chartTitle: '@chartTitle',
            data: '=chartData'
      },
      templateUrl: "/templates/radar_chart.html",
      link: (scope, element, attrs) ->
            console.log "radar chart directive loaded"
            currentName = ''

            attrs.$observe "currentproducer", (value) ->
                  currentName = value


            attrs.$observe "chartdata", (value) ->
                  console.log "watched data", angular.fromJson value
                  rawData = angular.fromJson value
                  rawFlavors = []
                  dataSets = []
                  indexAdjust = 0

                  colors = [
                        {
                              fill: "245, 171, 53",
                              stroke: "211, 84, 0"
                        },
                        {
                              fill: "52, 152, 219",
                              stroke: "58, 83, 155"
                        },
                        {
                              fill: "27, 188, 155",
                              stroke: "135, 211, 124"
                        },
                        {
                              fill: "142, 68, 173",
                              stroke: "249, 191, 59"
                        },
                        {
                              fill: "207, 0, 15",
                              stroke: "207, 0, 15"
                        }
                  ]

                  # create initial rawFlavor objects
                  rawData.forEach (item) ->
                        labs = []
                        nums = []
                        profile = {labels: null, data: null}
                        for key, value of item.flavor_profile
                              labs.push key
                              nums.push value
                        profile.labels = labs
                        profile.data = nums
                        rawFlavors.push(profile)


                  # construct dataSets array
                  rawFlavors.forEach (item, i) ->
                        # need access to current producer name
                        nameCheck = false
                        if i < 4
                              dataset = {}
                              dataset.data = item.data
                              dataset.label = rawData[i].name
                              dataset.fillColor = "rgba(" + colors[i].fill + ",0.4)"
                              dataset.strokeColor = "rgba(" + colors[i].sroke + ",1)"
                              dataset.pointColor = "rgba(220,220,220,1)"
                              dataset.pointStrokeColor = "rgba(" + colors[i].stroke + ",1)"
                              dataset.pointHighlightFill = "#fff"
                              dataset.pointHighlightStroke = "rgba(220,220,220,1)"
                              dataSets.push dataset

                  console.log "dataSets", dataSets
                  # construct cData object

                  cData = {
                        labels: rawFlavors[0].labels,
                        datasets: dataSets

                  }

                  # build chart
                  tplChildren = element.children()
                  window.kids = tplChildren
                  ctx = tplChildren[2].getContext('2d')
                  flavorRadarChart = new Chart(ctx).Radar(cData)

                  # add title
                  tplChildren[0].innerHTML = attrs.charttitle

                  #add legend
                  legendLabels = ''
                  dataSets.forEach (item, i) ->
                        legendLabels += '<span><a style="color: rgb(' + colors[i].fill + ');" href="/producers/' + rawData[i].id + '">' + item.label + '</a></span>'
                  tplChildren[1].innerHTML = legendLabels

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





















