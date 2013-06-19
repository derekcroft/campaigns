jQuery ->
  # only allow numbers in the fixed amount text field
  #$('.positive-integer').numeric { decimal: false, negative: false }

  # add the tooltips to the Learn More elements
  $(".learnmore").tooltip({position: 'bottom', offset: [-10,-140]})

  # start with the youtube image disabled
  $("#clip").hide()
  $("#holder").show()
  $("#video").click (e) ->
    $("#holder").hide()
    $("#clip").show()
    true
