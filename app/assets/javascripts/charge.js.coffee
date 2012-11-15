class Charge
  constructor: ->
    @apiKey = $('meta[name="stripe-key"]').attr('content')

$(document).ready ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

  $("#submit_donation").click ->
    card = new Card $('#card_number').val(), $('#card_month').val(), $('#card_year').val(), $('#card_code').val()
    unless card.expirationValid()
      $("#stripe_error").html("Card expiration must be #{Card.validExpirationMonthAndYear()} or later").show()
      $("#card_month").focus()
      return false
    unless card.cvcValid()
      if card.isAmericanExpress()
        $("#stripe_error").html("American Express card must have a four digit CVC").show()
      else
        $("#stripe_error").html("This card must have a three digit CVC").show()
      $("#card_code").focus()
      return false
    true

  pledge.setupForm()


pledge =
  setupForm: ->
    $('#new_pledge').submit ->
      $('#submit_donation').attr('disabled', true)
      pledge.processCard()

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, pledge.handleStripeResponse)
    false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_card_token').val(response.id)
      $("#new_pledge")[0].submit()
    else
      $("#stripe_error").text(response.error.message)
      $("#submit_donation").prop('disabled', false)


window.Charge = Charge
