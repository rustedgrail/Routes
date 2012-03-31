$ ->
  username = window.location.search.split("=")[1]
  $.ajax
    url: "https://api.twitter.com/1/statuses/user_timeline.json"
    dataType: "jsonp"
    crossDomain: true
    data:
      screen_name: username
      count: 5
      include_rts: true
    success: (data, status, xhr) ->
      $("#og_div").append("<ul>")
      for tweet in data
        $("#og_div").append("<li><input type=radio name=tweet value='#{escape(tweet.text)}' />#{tweet.text}<br>")
      $("#og_div").append("</ul>")
    
    error: (xhr, status, error) ->
      console.log "Error: #{error}"

  $("#submitForm").click (e) ->
    e.preventDefault()
    document.cookie = "tweet=#{$('input[name=tweet]:checked').val()}; path=/"
    window.location.href = "response.html"
