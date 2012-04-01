jQuery ->
  setFixedAmount = ->
    $("#fixedamount").prop('disabled', !$("#donation_type_fixed").is(":checked"))

  $(".donation_button").click setFixedAmount
  setFixedAmount()

