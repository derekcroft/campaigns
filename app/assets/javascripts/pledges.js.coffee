# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
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

  handleStripeResponse: (status, response) ->
    alert status
    alert response
    if status == 200
      alert(response.id)
    else
      alert(response.error.message)
