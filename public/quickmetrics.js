//QuickMetrics snippet to put in tracked application

$(document).ready( function(){

  var Blocmetrics = {

    send: function(name, data) {
      var _bm_request = new XMLHttpRequest();
      _bm_request.open("POST", "https://quickmetrics.herokuapp.com//api/events", true);
      _bm_request.setRequestHeader('Content-Type', 'application/json');
      _bm_request.onreadystatechange = function() {
        // this function runs when the Ajax request changes state.
        // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
      };
      _bm_request.send(JSON.stringify({auth_token: this.authToken, name: name, data: data}));
    }
  }

});

// From Privia example
// https://github.com/mkolenda/priviametrics/blob/master/public/assets/priviametrics.js
// NOTE - don't need arguments in original file

var quickmetrics = (function () {
    var my = {};
    _pm_event = {};

    my.track = function(name) {
            _pm_event.name = name;

            _send_data();
    };
//FIX Below data with quickmetrics specific app info above
    function _send_data() {
        _pm_request = new XMLHttpRequest();
        _pm_request.open("POST", "http://priviametrics.herokuapp.com/events.json", true);
        _pm_request.setRequestHeader('Content-Type', 'application/json');
        _pm_request.onreadystatechange = function () {
            // don't do anything here, we don't want to interfere with the behavior of the host site
        };
        _pm_request.send(JSON.stringify(_pm_event));
    };

    return my;
})();
