# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
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
    false

  handleStripeResponse: (status, response) ->
    if status == 200
      $("#new_pledge")[0].submit()
    else
      $("#stripe_error").text(response.error.message)
      $("#submit_donation").prop('disabled', false)


facebook =
  populateFields: (response) ->
    $('#first_name').val(response.first_name)
    $('#last_name').val(response.last_name)
    $('#email').val(response.email)
    $('#facebook_billing').slideUp('slow')
    $('#zip').focus()

  loginStatus: (response) ->
    if response.status == 'connected'
      # the user is logged in and has authenticated your
      # app, and response.authResponse supplies
      # the user's ID, a valid access token, a signed
      # request, and the time the access token
      # and signed request each expire
      FB.api('/me', facebook.populateFields)
    else if response.status == 'not_authorized'
      # the user is logged in to Facebook,
      # but has not authenticated your app
      alert 'not authorized'

#  wallPost: ->
#    body = 'Joined a Kiindly campaign'
#    FB.api '/me/feed', 'post', { message: body },
#          if (!response || response.error) {
#            alert('Error occured');
#          } else {
#            alert('Post ID: ' + response.id);
#          }

$ ->
  window.fbAsyncInit = ->
    FB.init { appId:'255484937866032', status:true, cookie:true, xfbml:true }
    FB.Event.subscribe('auth.statusChange', facebook.loginStatus)
    FB.getLoginStatus(facebook.loginStatus)

  app = (d) ->
    js = 'facebook-jssdk'
    id = 'facebook-jssdk'
    return if d.getElementById(id)
    js = d.createElement('script')
    js.id = id
    js.async = true
    js.src = "//connect.facebook.net/en_US/all.js"
    d.getElementsByTagName('head')[0].appendChild(js)
  app(document)
