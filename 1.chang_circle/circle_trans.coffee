html ->
  head ->
    meta charset:"utf-8"
    # script src:"http://d3js.org/d3.v3.min.js", charset:"utf-8"
    script src:"../js/d3/d3.v3.js", charset:"utf-8"
  body ->
    div id:'viz'
   
    coffeescript ->
      sampleSVG = d3.select("#viz")
        .append("svg")
        .attr("width", 200)
        .attr("height", 200)
      
      sampleSVG.append("circle")
          .style("stroke", "gray")
          .style("fill", "white")
          .attr("r", 60)
          .attr("cx", 90)
          .attr("cy", 70)
          .on("mouseover", -> d3.select(this).style("fill", "#ff0000"))
          .on("mouseout", -> d3.select(this).style("fill", "#ffffff"))           
          .on("click", -> animate_start(d3.select(this)))
          
          animate_start =(this1)->
            this1.transition()
              .delay(100)
              .duration(1000)
              .attr("r", 10)
              .attr("cx", 30)
              .style("fill", "#000000")
              .each("end", animate_stop)
          animate_stop =->
            d3.select(this).transition()
              .delay(0)
              .duration(1000)
              .attr("r", 60)
              .attr("cx", 90)
              .attr("cy", 70)
              .style("fill", "#ffffff")
          