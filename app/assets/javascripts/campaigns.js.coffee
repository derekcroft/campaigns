jQuery ->
  $("input[type=radio]").click ->
    alert $(this).find(".fixed_amount").is(":disabled")
  #amount.attr("disabled", !amount.is(":disabled"))
