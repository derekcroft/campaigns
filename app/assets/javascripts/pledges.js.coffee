#= require facebook
#= require stripe

postToFeed = (data) ->
  callback = (response) ->
  FB.ui data, callback
  false

jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  $('#facebook_popup').click ->
    postToFeed($(this).data())
    false

  # add the tooltips to the Learn More elements
  $(".whatisthis").tooltip({position: 'bottom center', relative: true})

  $(".instructional_text")
    .blur ->
      @value = 'Type a short message' if @value == ''
    .focus ->
      @value = '' if @value == 'Type a short message'
  $("#submit_donation")
    .click ->
      $it = $(".instructional_text")
      $it.val('') if $it.val() == 'Type a short message'

