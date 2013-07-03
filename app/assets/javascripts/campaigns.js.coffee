jQuery ->
  $('#sport').on 'change', ->
    selectedSport = @value.toLowerCase()
    $('.leaderboards').each ->
      $(@).toggle (@id is "leaderboard-table-#{selectedSport}")
    $('#leaderboard-table-all').show() unless selectedSport
