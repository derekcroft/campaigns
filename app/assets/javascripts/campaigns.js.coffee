jQuery ->
  # enable and disable fixed amount text field
  setFixedAmount = ->
    $("#fixedamount").prop('disabled', !$("#donation_type_fixed").is(":checked"))

  $(".donation_button").click setFixedAmount
  setFixedAmount()

  # start the hero image slideshow
  $('.slideshow').cycle {fx: 'fade', speed: 700, timeout: 5000}

  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  # handle fixed donations under $5 on the client side
  $('#fixedamount').blur ->
    if parseInt(this.value) < 5
      $('.donation_error').html 'Fixed donation must be at least $5.00'
      $('#submit_donation').prop('disabled', true)
    else
      $('.donation_error').html('')
      $('#submit_donation').prop('disabled', false).focus()

