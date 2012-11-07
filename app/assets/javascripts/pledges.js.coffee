#= require facebook

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

  monthNames = [
    "January", "February", "March", "April",
    "May", "June", "July", "August",
    "September", "October", "November", "December"
  ]
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

  $(".instructional_text")
    .blur ->
      @value = 'Type a short message' if @value == ''
    .focus ->
      @value = '' if @value == 'Type a short message'
  $("#submit_donation")
    .click ->
      $it = $(".instructional_text")
      $it.val('') if $it.val() == 'Type a short message'

#= require stripe

