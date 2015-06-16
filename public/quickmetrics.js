//snippet to put in tracked application

$(document).ready( function(){
  var _bm_event = {
    event: { name: "pageLoad"},
  }

  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "http://localhost:3000/api/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/json');
  _bm_request.onreadystatechange = function() {
    // respond to controller finish events
  };
  _bm_request.send(JSON.stringify(_bm_event));
});