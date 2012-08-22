jQuery ->
  isPennyPledge = ->
    !$("#pledge_pledge_type_fixed").is(":checked")

  # enable and disable fixed amount text field
  setFixedAmount = ->
    $("#pledge_amount").prop('disabled', isPennyPledge())
    $("#pledge_cap").prop('disabled', !isPennyPledge())

  $(".donation_button").click setFixedAmount
  setFixedAmount()

  # if they blur off the penny pledge cap and it's blank or less than $10, reset it to the slider value
  $('#pledge_cap').blur ->
    this.value = "20" if this.value == "" or parseInt(this.value) < 10

  # if they blur off the fixed pledge amount and it's blank or less than $5, reset it to $5
  $('#pledge_amount').blur ->
    if this.value == "" or parseInt(this.value) < 5
      $('.donation_error').html 'Fixed donation must be at least $5.00'
      $('#submit_donation').prop('disabled', true)
      this.value = "5"
      $('#pledge_amount').focus()
    else
      $('.donation_error').html('')
      $('#submit_donation').prop('disabled', false)

  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  # add the tooltips to the Learn More elements
  $(".learnmore").tooltip({position: 'bottom', offset: [-10,-140]})

  # start with the youtube image disabled
  $("#clip").hide()
  $("#holder").show()
  $("#video").click (e) ->
    $("#holder").hide()
    $("#clip").show()
    true
