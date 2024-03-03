/*
Template Name: HUD - Responsive Bootstrap 5 Admin Template
Version: 1.6.0
Author: Sean Ngu
Website: http://www.seantheme.com/hud/
*/

var handleRenderChartJs = function() {
	Chart.defaults.font.family = app.font.family;
	Chart.defaults.color = 'rgba('+ app.color.whiteRgb +', .5)';
	Chart.defaults.plugins.legend.display = false;
	Chart.defaults.plugins.tooltip.padding = 8;
	Chart.defaults.plugins.tooltip.backgroundColor = 'rgba('+ app.color.gray800Rgb +', .95)';
	Chart.defaults.plugins.tooltip.titleFont.family = app.font.family;
	Chart.defaults.plugins.tooltip.titleFont.weight = 600;
	Chart.defaults.plugins.tooltip.footerFont.family = app.font.family;
	Chart.defaults.scale.grid.color = 'rgba('+ app.color.whiteRgb +', .25)';
	Chart.defaults.scale.ticks.backdropColor = 'rgba('+ app.color.whiteRgb + ', 0)';
	
	var ctx = document.getElementById('barChart');
	var barChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['S','M','T','W','T','F','S'],
			datasets: [{
				label: 'Total Visitors',
				data: [37,31,36,34,43,31,50],
				backgroundColor: 'rgba('+ app.color.whiteRgb +', .5)',
				borderColor: 'transparent'
			}]
		},
		options: {
			legend: {
				display: false
			},
			tooltips: {
				callbacks: {
					title: function(tooltipItems, data) { 
						var tooltipTitle = '';
						switch (tooltipItems[0].index) {
							case 0: tooltipTitle = 'Sunday'; break;
							case 1: tooltipTitle = 'Monday'; break;
							case 2: tooltipTitle = 'Tuesday'; break;
							case 3: tooltipTitle = 'Wednesday'; break;
							case 4: tooltipTitle = 'Thursday'; break;
							case 5: tooltipTitle = 'Friday'; break;
							case 6: tooltipTitle = 'Saturday'; break;
						}
						return tooltipTitle;
					},
					labelColor: function(tooltipItem, chart) {
						return {
							borderColor: 'transparent',
							backgroundColor: 'rgba('+ app.color.whiteRgb +', .5)'
						};
					}
				}
			},
			scales: {
				yAxes: {
					gridLines: {
						borderDashOffset: 10,
						drawTicks: false,
						drawBorder: false,
						borderDash: [10]
					},
					ticks: {
						display: false
					}
				},
				xAxes: {
					barPercentage: 1,
					gridLines : {
						display : false
					}
				}
			}
		}
	});
};


/* Init Demo
------------------------------------------------ */
$(document).ready(function() {
	handleRenderChartJs();
});