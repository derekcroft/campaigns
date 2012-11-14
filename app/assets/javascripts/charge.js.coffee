class Card
  constructor: (@number, @expirationMonth, @expirationYear, @cvc) ->

  @monthName: (monthNumber) ->
    monthNames = [
      "January", "February", "March", "April",
      "May", "June", "July", "August",
      "September", "October", "November", "December"
    ]
    monthNames[monthNumber-1]

  expirationValid: ->
    today = new Date
    expirationDate = new Date(@expirationYear, @expirationMonth)
    expirationDate > today

window.Card = Card

$(document).ready ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

  today = new Date

  $("#submit_donation").click ->
    if parseInt($("#card_month").val()) < 6 && $("#card_year").val() == "2012"
      $("#stripe_error").html("Card expiration must be #{monthNames[today.getMonth()]} #{today.getFullYear()} or later").show()
      $("#card_month").focus()
      return false
    if ($("#card_number").val().substring(0,2) == "34" || $("#card_number").val().substring(0,2) == "37")
      unless $("#card_code").val().length == 4
        $("#stripe_error").html("American Express card must have a four digit CVC").show()
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

