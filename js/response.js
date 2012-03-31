(function() {
  var getCookie;

  getCookie = function() {
    var kvp, parts, _i, _len, _ref;
    _ref = document.cookie.split(";");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      kvp = _ref[_i];
      parts = kvp.split("=");
      if (parts[0] === "tweet") return parts[1];
    }
  };

  $(function() {
    var tweet;
    tweet = getCookie();
    $("#og_div").append("<h1>" + tweet + "</h1>");
    return document.cookie = 'tweet=; expires=Thu, 01 Jan 1970 00:00:00 GMT;';
  });

}).call(this);
