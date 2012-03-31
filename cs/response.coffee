getCookie = ->
  for kvp in document.cookie.split ";"
    parts = kvp.split "="
    return parts[1] if parts[0] == "tweet"

$ ->
  tweet = getCookie()
  $("#og_div").append("<h1>#{tweet}</h1>")
  document.cookie = 'tweet=; expires=Thu, 01 Jan 1970 00:00:00 GMT;';

