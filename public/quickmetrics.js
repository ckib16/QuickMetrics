//QuickMetrics snippet to put in tracked application

$(document).ready( function(){
  track: function(event_name) {
    var _bm_event = {
      event: { name: event_name},
    }
    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "https://quickmetrics.herokuapp.com//api/events", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    _bm_request.onreadystatechange = function() {
      // respond to controller finish events
    };
    _bm_request.send(JSON.stringify(_bm_event));
  }

});


