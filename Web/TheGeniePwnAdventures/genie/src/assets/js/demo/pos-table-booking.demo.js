/*
Template Name: HUD - Responsive Bootstrap 5 Admin Template
Version: 1.6.0
Author: Sean Ngu
Website: http://www.seantheme.com/hud/
*/

var handleCheckTime = function(i) {
	"use strict";
	
	if (i < 10) {i = "0" + i};
	return i;
};
		
var handleStartTime = function() {
	"use strict";
	
	var today = new Date();
	var h = today.getHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	var a;
	m = handleCheckTime(m);
	s = handleCheckTime(s);
	a = (h > 11) ? 'pm' : 'am';
	h = (h > 12) ? h - 12 : h;
	document.getElementById('time').innerHTML = h + ":" + m + a;
	var t = setTimeout(handleStartTime, 500);
};

var handleDatepicker = function() {
	"use strict";
	
	$('[data-render="datepicker"]').datepicker({
		todayHighlight: true,
		autoclose: true
	});
};
		
$(document).ready(function() {
	handleStartTime();
	handleDatepicker();
});