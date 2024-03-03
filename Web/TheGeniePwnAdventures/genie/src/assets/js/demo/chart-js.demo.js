/*
Template Name: HUD - Responsive Bootstrap 5 Admin Template
Version: 1.6.0
Author: Sean Ngu
Website: http://www.seantheme.com/hud/
*/

var lineChart, barChart, radarChart, polarAreaChart, pieChart, doughnutChart;

var handleRenderChartJs = function() {
	Chart.defaults.font.family = app.font.family;
	Chart.defaults.color = 'rgba('+ app.color.whiteRgb +', .2)' +', .5)';
	Chart.defaults.plugins.legend.display = false;
	Chart.defaults.plugins.tooltip.padding = 8;
	Chart.defaults.plugins.tooltip.backgroundColor = 'rgba('+ app.color.gray800Rgb +', .95)';
	Chart.defaults.plugins.tooltip.titleFont.family = app.font.family;
	Chart.defaults.plugins.tooltip.titleFont.weight = 600;
	Chart.defaults.plugins.tooltip.footerFont.family = app.font.family;
	Chart.defaults.scale.grid.color = 'rgba('+ app.color.whiteRgb +', .25)';
	Chart.defaults.scale.ticks.backdropColor = 'rgba('+ app.color.whiteRgb +', .2)' +', 0)';
	
	
	var ctx = document.getElementById('lineChart');
	lineChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
			datasets: [{
				color: app.color.theme,
				backgroundColor: 'rgba('+ app.color.themeRgb +', .2)',
				borderColor: app.color.theme,
				borderWidth: 1.5,
				pointBackgroundColor: app.color.theme,
				pointBorderWidth: 1.5,
				pointRadius: 4,
				pointHoverBackgroundColor: app.color.theme,
				pointHoverBorderColor: app.color.theme,
				pointHoverRadius: 7,
				label: 'Total Sales',
				data: [12, 19, 4, 5, 2, 3]
			}]
		}
	});
	
	var ctx2 = document.getElementById('barChart');
	barChart = new Chart(ctx2, {
		type: 'bar',
		data: {
			labels: ['Jan','Feb','Mar','Apr','May','Jun'],
			datasets: [{
				label: 'Total Visitors',
				data: [37,31,36,34,43,31],
				backgroundColor: 'rgba('+ app.color.themeRgb +', .5)',
				borderColor: app.color.theme,
				borderWidth: 1.5
			},{
				label: 'New Visitors',
				data: [12,16,20,14,23,21],
				backgroundColor: 'rgba('+ app.color.whiteRgb +', .2)' +', .5)',
				borderColor: 'rgba('+ app.color.whiteRgb +', .65)',
				borderWidth: 1.5
			}]
		}
	});
	
	var ctx3 = document.getElementById('radarChart');
	radarChart = new Chart(ctx3, {
		type: 'radar',
		data: {
			labels: ['United States', 'Canada', 'Australia', 'Netherlands', 'Germany', 'New Zealand', 'Singapore'],
			datasets: [
				{
					label: 'Mobile',
					backgroundColor: 'rgba('+ app.color.themeRgb +', .2)',
					borderColor: app.color.theme,
					pointBackgroundColor: app.color.theme,
					pointBorderColor: app.color.theme,
					pointHoverBackgroundColor: app.color.theme,
					pointHoverBorderColor: app.color.theme,
					data: [65, 59, 90, 81, 56, 55, 40],
					borderWidth: 1.5
				},
				{
					label: 'Desktop',
					backgroundColor: 'rgba('+ app.color.gray500Rgb +', .2)',
					borderColor: app.color.gray500,
					pointBackgroundColor: app.color.gray500,
					pointBorderColor: app.color.gray500,
					pointHoverBackgroundColor: app.color.gray500,
					pointHoverBorderColor: app.color.gray500,
					data: [28, 48, 40, 19, 96, 27, 100],
					borderWidth: 1.5
				}
			]
		}
	});
	
	var ctx4 = document.getElementById('polarAreaChart');
	polarAreaChart = new Chart(ctx4, {
		type: 'polarArea',
		data: {
			datasets: [{
				data: [11, 16, 7, 3, 14],
				backgroundColor: ['rgba('+ app.color.themeRgb +', .5)', 'rgba('+ app.color.whiteRgb +', .2)' +', .5)', 'rgba('+ app.color.gray300Rgb +', .5)', 'rgba('+ app.color.gray500Rgb +', .5)', 'rgba('+ app.color.gray800Rgb +', .5)'],
				borderWidth: 0
			}],
			labels: ['IE', 'Safari', 'Chrome', 'Firefox', 'Opera']
		}
	});
	
	var ctx5 = document.getElementById('pieChart');
	pieChart = new Chart(ctx5, {
		type: 'pie',
		data: {
			labels: ['Total Visitor', 'New Visitor', 'Returning Visitor'],
			datasets: [{
				data: [300, 50, 100],
				backgroundColor: ['rgba('+ app.color.themeRgb +', .5)', 'rgba('+ app.color.whiteRgb +', .2)' +', .5)', 'rgba('+ app.color.themeRgb +', .5)'],
				hoverBackgroundColor: ['rgba('+ app.color.themeRgb +', 1)', 'rgba('+ app.color.whiteRgb +', 1)', 'rgba('+ app.color.gray900Rgb +', 1)'],
				borderWidth: 0
			}]
		}
	});
	
	var ctx6 = document.getElementById('doughnutChart');
	doughnutChart = new Chart(ctx6, {
		type: 'doughnut',
		data: {
			labels: ['Total Visitor', 'New Visitor', 'Returning Visitor'],
			datasets: [{
				data: [300, 50, 100],
				backgroundColor: ['rgba('+ app.color.themeRgb +', .5)', 'rgba('+ app.color.whiteRgb +', .2)' +', .5)', 'rgba('+ app.color.themeRgb +', .5)'],
				hoverBackgroundColor: [app.color.theme, app.color.white, app.color.gray900],
				borderWidth: 0
			}]
		}
	});
};

/* Controller
------------------------------------------------ */
$(document).ready(function() {
	handleRenderChartJs();
	
	$(document).on('theme-reload', function() {
		lineChart.destroy();
		barChart.destroy();
		radarChart.destroy();
		polarAreaChart.destroy();
		pieChart.destroy();
		doughnutChart.destroy();
		
		handleRenderChartJs();
	});
	
});