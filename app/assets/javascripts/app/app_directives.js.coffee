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


# ScotchApp.directive "searchDirective", () ->
#   return {
#     restrict: "A",
#     scope: true,
#     template: "<h2>Hello {{results.currentPage}}</h2>"

#   }

# ScotchApp.directive "showRegionDesc", () ->
#   return {
#     restrict: "A",
#     scope: {
#       region: "="
#       },
#     templateUrl: "templates/region_modal.html"

#   }

# ScotchApp.directive "bubbleChart", () ->
#   return {
#     restrict: "A",
#     scope: {
#         data: "=bubbleChartData"
#         },
#     templateUrl: "bubble_chart.html",
#     link: ($scope, element, attrs) ->
#         console.log "attrs", attrs
#         console.log "element", element
#         console.log "scope", $scope.data
      # width = 600
      # height = 400
      # data = $scope.data
      # console.log data

      # canvas = d3.select element
      #   .append "svg"
      #     .attr "width", width
      #     .attr "height", height
      #     .attr "class", "bubbles"
      #     .append "g"
      #     .attr "transform", "translate(50, 50)"
      # xRange = d3.scale.linear().range([10, 250])
      #   .domain([
      #     d3.min data, (d) ->
      #       d.rating
      #     ,
      #     d3.max data, (d) ->
      #       d.rating
      #     ])

      # yRange = d3.scale.linear().range([20, 300])
      #   .domain([
      #     d3.min data, (d) ->
      #       d.age
      #     ,
      #     d3.max data, (d) ->
      #       d.age
      #     ])

      # xAxis = d3.svg.axis().scale(xRange)
      # yAxis = d3.svg.axis().scale(yRange).orient('left')

      # canvas.append('svg:g').call(xAxis)
      #   .attr('transform', 'translate(0, 320)')
      #   .attr('fill', '#999')
      # canvas.append('svg:g').call(yAxis)
      #   .attr('transform', 'translate(0, 0)')
      #   .attr('fill', '#999')

      # d3.selectAll('g.tick')
      #   .attr('font-size', '.85em')

  # }


















