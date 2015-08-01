// JS to be added for remote app
// Derived from StackOverflow & LunaMetrics at http://buff.ly/12bFTwk

$(document).ready(function() {

	$("a").click(function() {
		var text = $(this).text();

    // test 'text' with a jquery alert
    // alert(text)

    // call quickmetrics function
    quickmetrics.track(text)
	});

});
