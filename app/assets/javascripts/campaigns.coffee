$ ->
  $("#fixed_pledge_type").click (thing) ->
    amount = $(".fixedamount")
    amount.attr("disabled", !amount.is(":disabled"))
