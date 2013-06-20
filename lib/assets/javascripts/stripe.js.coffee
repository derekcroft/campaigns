$(document).ready ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

  monthNames = [
    "January", "February", "March", "April",
    "May", "June", "July", "August",
    "September", "October", "November", "December"
  ]

  $("#submit_donation").click ->
    unless card.validCardNumber()
      $("#stripe_error").html("The card number you entered does not appear to be valid.").show()
      $("#card_number").focus()
      return false
    unless card.validExpiration()
      today = new Date
      $("#stripe_error").html("Card expiration must be #{monthNames[today.getMonth()+1]} #{today.getFullYear()} or later").show()
      $("#card_month").focus()
      return false
    unless card.validCVC()
      $("#stripe_error").html("The CVC number you entered is not valid.").show()
      $("#card_code").focus()
      return false
    if Stripe.card.cardType($('#card_number').val()) == 'American Express'
      unless $("#card_code").val().length == 4
        $("#stripe_error").html("American Express card must have a four digit CVC").show()
        $("#card_code").focus()
        return false
    true

  pledge.setupForm()

card =
  validExpiration: ->
    expYear = parseInt $('#card_year').val()
    expMonth = parseInt($('#card_month').val()) - 1
    Stripe.card.validateExpiry expMonth, expYear

  validCardNumber: ->
    cardNumber = $('#card_number').val()
    Stripe.card.validateCardNumber cardNumber

  validCVC: ->
    cvc = $('#card_code').val()
    Stripe.card.validateCVC cvc

pledge =
  setupForm: ->
    $('#new_pledge').submit ->
      $('#submit_donation').attr('disabled', true)
      pledge.processCard()

  processCard: ->
    creditCard =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(creditCard, pledge.handleStripeResponse)
    false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_card_token').val(response.id)
      $("#new_pledge")[0].submit()
    else
      $("#stripe_error").text(response.error.message)
      $("#submit_donation").prop('disabled', false)

