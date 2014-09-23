

ScotchApp.directive("bubbleChart", function() {

  return {
    restrict: "A",
    scope: {
      whiskyData: '=bubbleChart',
      show: '=ngShow'
    },
    template: '<div class="title"><h2>Most Expensive Scotch</h2><p>Charted by rating and age</p><div id="bubble-canvas"></div></div>',
    link: function($scope, element, attrs) {

      console.log("element", element)
      console.log("attrs", attrs.ngShow)

      var drawGraph = function(value) {

        console.log("initial value: ", value)
        var data = value.slice(0, 10);

        console.log("data caught!", data)
        var width = 600,
        height = 400;

        var canvas = d3.select('#bubble-canvas')
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
            d3.max(data, function(d) {
              return d.age;
            }),
            d3.min(data, function(d) {
              return d.age;
            })
          ]);
        // jack danger, square
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

        // separate the animations so they can be triggered on
        // showing the modal
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
          .attr('r', function(d) { return d.price / (width - 500);})
          .attr('cx', function(d) { return xRange(d.rating); })
          .attr('cy', function(d) { return yRange(d.age); })
          .attr('fill', function(d) { return 'rgba(' + (d.producer_id * 20) + ',' + (d.producer_id* 10) + ',' +  (d.producer_id * 40) + ',0.8)'; })
          .style('opacity', 0.5)
          .transition()
          .duration(2000)
          .delay(500)
          .attr('r', function(d) {
            if(d.price / (width - 500) > 100) {
              return (d.price / (width - 500)) - 50;
            } else if(d.price / (width - 500) < 5) {
              return 5;
            } else {
              return d.price / (width - 500);
            }

          })
          .transition()
          .duration(500)
          //.attr('r', function(d) {return (d.price / (width - 500) > 1) ? d.price / (width - 500) : 1;})

        circles.append('text')
          .attr('fill', 'black')
          .attr('x', 12)
          .attr('dy', ".35em")
          .attr('class', 'node-label')
          .text(function(d) { return d.name; });

        var sideBar = d3.select('#bubble-canvas').append('div')
          .attr('class', 'sideBar');

        var sideBarElements = sideBar.selectAll('text').data(data);

        sideBarElements.enter()
          .append('a')
          .attr('class', 'sidebar')
          .append('text')
          .text(function(d) { return d.name; })

        return circles;
      };

      $scope.$watch("whiskyData", function(value){
        console.log("changed", value)

        element.empty();
        element.append('<div class="title"><h2>Most Expensive Scotch</h2><p>Charted by rating and age</p><div id="bubble-canvas"></div>')
        var circles = drawGraph(value);
        window.circs = circles;

      });

    } // end link
  }


});





