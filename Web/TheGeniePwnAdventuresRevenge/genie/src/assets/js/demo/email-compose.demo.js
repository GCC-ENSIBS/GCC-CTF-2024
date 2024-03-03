/*
Template Name: HUD - Responsive Bootstrap 5 Admin Template
Version: 1.6.0
Author: Sean Ngu
Website: http://www.seantheme.com/hud/
*/

var handleRenderSummernote = function() {
	var totalHeight = ($(window).width() >= 767) ? $(window).height() - $('.summernote').offset().top - 90 : 400;
	$('.summernote').summernote({
		height: totalHeight
	});
};

var handleEmailTagsInput = function() {
	$('#email-to').tagit({
		availableTags: ["admin2@seantheme.com", "admin3@seantheme.com", "admin4@seantheme.com", "admin5@seantheme.com", "admin6@seantheme.com", "admin7@seantheme.com", "admin8@seantheme.com"]
	});
	$('#email-cc').tagit({
		availableTags: ["admin2@seantheme.com", "admin3@seantheme.com", "admin4@seantheme.com", "admin5@seantheme.com", "admin6@seantheme.com", "admin7@seantheme.com", "admin8@seantheme.com"]
	});
	$('#email-bcc').tagit({
		availableTags: ["admin2@seantheme.com", "admin3@seantheme.com", "admin4@seantheme.com", "admin5@seantheme.com", "admin6@seantheme.com", "admin7@seantheme.com", "admin8@seantheme.com"]
	});
};


/* Controller
------------------------------------------------ */
$(document).ready(function() {
	handleRenderSummernote();
	handleEmailTagsInput();
});