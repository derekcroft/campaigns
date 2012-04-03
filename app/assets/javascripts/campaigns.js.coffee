jQuery ->
  setFixedAmount = ->
    $("#fixedamount").prop('disabled', !$("#donation_type_fixed").is(":checked"))

  $(".donation_button").click setFixedAmount
  setFixedAmount()

  $('.slideshow').cycle {fx: 'fade', speed: 700, timeout: 5000}

