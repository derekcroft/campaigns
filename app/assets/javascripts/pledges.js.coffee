#= require stripe
#= require facebook

postToFeed = ->
  obj =
    method: 'feed'
    link: 'https://developers.facebook.com/docs/reference/dialogs/'
    name: 'Oakland University Alumni Association'
    picture: 'http://kiindly.net/sites/oaklandalum/oaklandalum-pinterest.jpg'
    caption: 'Kiindly Penny Pledge'
    description: 'I just made a difference at Kiindly.com. Follow my link to join the crowd.'
  callback = (response) ->
  FB.ui obj, callback
  false

jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  $('#facebook_popup').click ->
    postToFeed()
    false

