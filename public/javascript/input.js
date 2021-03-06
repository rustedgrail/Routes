
  $(function() {
    var username;
    username = window.location.search.split("=")[1];
    $.ajax({
      url: "https://api.twitter.com/1/statuses/user_timeline.json",
      dataType: "jsonp",
      crossDomain: true,
      data: {
        screen_name: username,
        count: 5,
        include_rts: true
      },
      success: function(data, status, xhr) {
        var tweet, _i, _len, _results;
        $("#og_div").append("<ul></ul>");
        _results = [];
        for (_i = 0, _len = data.length; _i < _len; _i++) {
          tweet = data[_i];
          _results.push($("ul").append("<li><input type=radio name=tweet value='" + (escape(tweet.text)) + "' id=" + tweet.id + " /><label for=" + tweet.id + ">" + tweet.text + "</label>"));
        }
        return _results;
      },
      error: function(xhr, status, error) {
        return console.log("Error: " + error);
      }
    });
    return $("#submitForm").click(function(e) {
      e.preventDefault();
      document.cookie = "tweet=" + ($('input[name=tweet]:checked').val()) + "; path=/";
      return window.location.href = "response.html";
    });
  });
