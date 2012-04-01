$ ->
  window.fbAsyncInit = ->
    FB.init { appId:'255484937866032', status:true, cookie:true, xfbml:true }
    FB.Event.subscribe('auth.statusChange', facebook.loginStatus)
    FB.getLoginStatus(facebook.loginStatus, true)

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

#  wallPost: ->
#    body = 'Joined a Kiindly campaign'
#    FB.api '/me/feed', 'post', { message: body },
#          if (!response || response.error) {
#            alert('Error occured');
#          } else {
#            alert('Post ID: ' + response.id);
#          }

