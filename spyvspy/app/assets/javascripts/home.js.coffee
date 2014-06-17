update_member_count = (num) ->
  $("#players-count").html(num)

add_member = (id, info) ->
  $("#players-list").append($(
    "<div id=\"" + id + "\" class = \"player-row\">" + id + "</div>"
  ))

$(document).ready ->
  # mixpanel.track "Testing"
  pusher = new Pusher('09cf08647086db9a063a', { authEndpoint: '/auth' });
  channel = pusher.subscribe('presence-spyvspy')
  channel.bind 'pusher:subscription_succeeded', (members) ->
    update_member_count(members.count)
    members.each (member) ->
      add_member(member.id, member.info)
  channel.bind 'handshake_request', (data) -> alert data.message
