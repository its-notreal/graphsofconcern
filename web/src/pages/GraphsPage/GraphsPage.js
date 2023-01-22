import { Link, routes } from '@redwoodjs/router'
import { MetaTags } from '@redwoodjs/web'
import * as d3 from 'd3'

const GraphsPage = () => {
  const drawChart = function()  {
    const data = [12, 5, 6, 6, 9, 10];

    const svg = d3.select("#SimpleBarChart")
      .append("svg")
      .attr("width", 700)
      .attr("height", 300);

    svg.selectAll("rect")
      .data(data)
      .enter()
      .append("rect")
      .attr("x", (d, i) => i * 70)
      .attr("y", (d, i) => 300 - 10 * d)
      .attr("width", 65)
      .attr("height", (d, i) => d * 10)
      .attr("fill", "green");
  }
  drawChart()
  return (
    <>
      <MetaTags title="Graphs" description="Graphs page" />

      <h1>GraphsPage</h1>
      <span id={"SimpleBarChart"}></span>
    </>
  )
}

export default GraphsPage
