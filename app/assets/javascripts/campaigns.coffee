$ ->
  $("#donation_type_fixed").click (thing) ->
    amount = $(".fixedamount")
    amount.attr("disabled", !amount.is(":disabled"))
