console.log('in month.js.erb');
// Get the context of the canvas element we want to select
//$('#myChart').attr('width', 400);
//$('#myChart').attr('height', 400);
console.log('creating the chart');
var ctx = document.getElementById("myChart").getContext("2d");
var month_days = <%= raw @month_days %>;
var month_steps = <%= raw @month_steps %>;
console.log('@month_days', month_days);
console.log('@month_steps', month_steps);
var data = {
		labels: month_days,
		datasets: [
				{
						label: "My First dataset",
						//fillColor: "rgba(220,220,220,0.2)",
						//fillColor: "rgba(33,210,96,0.2)",
						fillColor: "rgba(0,205,236,0.2)",
						//strokeColor: "rgba(220,220,220,1)",
						strokeColor: "rgba(33,210,96,1)",
						//pointColor: "rgba(220,220,220,1)",
						pointColor: "rgba(0,205,236,1)",
						pointStrokeColor: "#fff",
						pointHighlightFill: "#fff",
						pointHighlightStroke: "rgba(220,220,220,1)",
						data: month_steps
				}
		]
};
var myLineChart = new Chart(ctx).Line(data);
//window.chartUp = true;
