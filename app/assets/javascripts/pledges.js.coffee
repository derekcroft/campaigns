# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  pledge.setupForm()

window.fbAsyncInit = ->
  FB.init({appId: '255484937866032', status: true, cookie: true, xfbml: true})
  FB.getLoginStatus (response) ->
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
      $("#fb-registration").remove
  , true

# Load the SDK Asynchronously
sdk = (d) ->
  js = id = 'facebook-jssdk'
  ref = d.getElementsByTagName('script')[0]
  return if d.getElementById(id)
  js = d.createElement('script')
  js.id = id
  js.async = true
  js.src = "//connect.facebook.net/en_US/all.js"
  ref.parentNode.insertBefore(js, ref)
sdk document

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
