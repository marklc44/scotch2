

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
              .attr('transform', 'translate(50, 25)');

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
        // also maybe create my own axes
        // these look crappy
        var xAxis = d3.svg.axis().scale(xRange);
        var yAxis = d3.svg.axis().scale(yRange).orient('left');

        canvas.append('svg:g').call(xAxis)
          .attr('transform', 'translate(0, 320)')
          .attr('fill', '#fff');
        canvas.append('svg:g').call(yAxis)
          .attr('transform', 'translate(0, 0)')
          .attr('fill', '#fff');

        d3.selectAll('g.tick')
          .attr('font-size', '.85em')

        canvas.append("text")
          .attr('class', 'axis-label y')
          .attr('text-anchor', 'end')
          .attr('y', -18)
          .attr('dy', -20)
          .attr('x', -120)
          .attr('transform', 'rotate(-90)')
          .attr('fill', '#fff')
          .text('Age')

        canvas.append("text")
          .attr('class', 'axis-label x')
          .attr('text-anchor', 'end')
          .attr('y', 360)
          .attr('x', 265)
          .attr('fill', '#fff')
          .text('Rating')


        var circles = canvas.selectAll('circle').data(data);

        // separate the animations so they can be triggered on
        // showing the modal
        circles.enter()
          .insert('circle')
          // can start them all in one place and transition them
          // with physics related tweening
          .attr('class', function(d){ return "bubble id" + d.id})
          .attr('data-id', function(d) {return d.id})
          .attr('cx', 300)
          .attr('cy', 200)
          .attr('fill', 'steelblue')
          .attr('r', function(d) { return 10; })
          .transition()
          .duration(1000)
          .attr('r', function(d) {
            if(d.price / (width - 500) > 100) {
              return (d.price / (width - 500)) - 60;
            } else if(d.price / (width - 500) < 5) {
              return 4;
            } else {
              return d.price / (width - 450);
            }
          })
          .attr('cx', function(d) { return xRange(d.rating); })
          .attr('cy', function(d) { return yRange(d.age); })
          .attr('fill', function(d) { return 'rgba(' + (d.producer_id * 20 > 255 ? 255 : d.producer_id * 20) + ',' + (d.producer_id * 10 > 255 ? 255 : d.producer_id * 10) + ',' +  (d.producer_id * 40 > 255 ? 255 : d.producer_id * 40) + ', 1.0)'; })
          .style('opacity', 0.4)
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
          .attr('class', function(d){ return "sidebar id" + d.id})
          .attr('data-id', function(d) {return d.id})
          .attr('href', function(d) {return "/whiskies/" + d.id})
          .append('text')
          .text(function(d) { return d.name + " | $" + d.price; });

        return circles;
      };

      $scope.$watch("whiskyData", function(value){
        console.log("changed", value)

        element.empty();
        element.append('<div class="title"><h2>Most Expensive Scotch</h2><p>Charted by rating and age</p><div id="bubble-canvas"></div>')
        var circles = drawGraph(value);
        window.circs = circles;

        $('a.sidebar').hover(function() {
        var id = $(this).attr("data-id");
        console.log("highlighted")
        $('.bubble').css('stroke', 'none').css('stroke-width', '0')
        $('.bubble').each(function() {
          if($(this).attr("data-id") === id) {
            $(this).css('stroke', 'yellow').css('stroke-width', 8);
          }
        })
      }, function() {
          $('.bubble').css('stroke-width', 0);
        });

      $('.bubble').hover(function() {
        var id = $(this).attr("data-id");
        $('a.sidebar').each(function() {
          if($(this).attr("data-id") === id) {
            $(this).toggleClass('text-highlight')
          }
        });
      });

      $('.bubble').click(function() {
        var id = $(this).attr("data-id");
        $('a.sidebar').each(function() {
          if($(this).attr("data-id") === id) {
            $(this).toggleClass('text-highlight')
          }
        });
      });

      }); // end watch



    } // end link
  }


});





