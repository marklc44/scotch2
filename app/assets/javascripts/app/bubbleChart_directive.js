

ScotchApp.directive("bubbleChart", function() {

  return {
    restrict: "A",
    scope: {
      data: "=bubbleChartData"
    },
    templateUrl: "/whisky_templates/bubble_chart.html",
    link: function($scope, element, attrs) {
      var width = 600,
      height = 400;

      var data = [];

      var canvas = d3.select('body')
        .append('svg')
          .attr('width', width)
          .attr('height', height)
          .attr('class', 'bubbles')
          .append('g')
            .attr('transform', 'translate(50, 50)');

      var xRange = d3.scale.linear().range([10, 520]).domain([
          d3.min(data, function(d) {
            return d.rating;
          }),
          d3.max(data, function(d) {
            return d.rating;
          })
        ]);
      var yRange = d3.scale.linear().range([20, 300]).domain([
          d3.min(data, function(d) {
            return d.age;
          }),
          d3.max(data, function(d) {
            return d.age;
          })
        ]);

      // also maybe create my own axes
      // these look crappy
      var xAxis = d3.svg.axis().scale(xRange);
      var yAxis = d3.svg.axis().scale(yRange).orient('left');

      canvas.append('svg:g').call(xAxis)
        .attr('transform', 'translate(0, 320)')
        .attr('fill', '#999');
      canvas.append('svg:g').call(yAxis)
        .attr('transform', 'translate(0, 0)')
        .attr('fill', '#999');

      d3.selectAll('g.tick')
        .attr('font-size', '.85em')

      var circles = canvas.selectAll('circle').data(data);

      circles.enter()
        .insert('circle')
        // can start them all in one place and transition them
        // with physics related tweening
        .attr('class', 'bubble')
        .attr('cx', 300)
        .attr('cy', 200)
        .attr('fill', 'steelblue')
        .attr('r', function(d) { return 10; })
        .transition()
        .duration(1000)
        .attr('r', function(d) { return d.price / (width - 100);})
        .attr('cx', function(d) { return xRange(d.rating); })
        .attr('cy', function(d) { return yRange(d.age); })
        .attr('fill', function(d) { return 'rgba(' + (d.brandId * 20) + ',' + (d.brandId * 10) + ',' +  (d.brandId * 40) + ',0.8)'; })
        .transition()
        .duration(2000)
        .delay(500)
        .attr('r', function(d) { return d.price / (width - 100);})
        .transition()
        .duration(500)
        .attr('r', function(d) {return d.price / (width - 50);})

      circles.append('text')
        .text(function(d) { return d.name + ' | ' + d.age; })
        .attr('color', 'white')
        .attr('class', 'label');


      var sideBar = d3.select('body').append('div')
        .attr('class', 'sideBar');

      var sideBarElements = sideBar.selectAll('text').data(data);

      sideBarElements.enter()
        .insert('rect')
        .attr('left', 10)
        .attr('top', function(d, i) { return i * 20; })
        .append('text')
        .text(function(d) { return d.brand; })
    } // end link
  }


});





