# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  pledge.setupForm()
  FB.init({appId: '255484937866032', status: true, cookie: true, xfbml: true})
  FB.getLoginStatus (response) ->
    alert response.status
    if response.status == 'connected'
      #the user is logged in and has authenticated your
      #app, and response.authResponse supplies
      #the user's ID, a valid access token, a signed
      #request, and the time the access token 
      #and signed request each expire
      uid = response.authResponse.userID
      accessToken = response.authResponse.accessToken
      alert uid
      alert accessToken
    else if response.status == 'not_authorized'
      #the user is logged in to Facebook, 
      #but has not authenticated your app
      alert 'logged in but not registered'
    else
      alert 'not logged in'
      #the user isn't logged in to Facebook.
  , true

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
      $("#new_pledge")[0].submit()
    else
      $("#stripe_error").text(response.error.message)
      $("#submit_donation").prop('disabled', false)
