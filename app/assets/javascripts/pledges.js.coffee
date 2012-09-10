#= require facebook

postToFeed = ->
  obj =
    method: 'feed'
    link: 'https://www.oupledge.com/?ref=KiindlyFB'
    name: 'Oakland University Alumni Association'
    picture: 'http://kiindly.net/sites/oaklandalum/oaklandalum-pinterest.jpg'
    caption: 'Kiindly Penny Pledge'
    description: "I just made a difference at oupledge.com. Help increase
      everyone's donation by one penny by taking the OUAA Penny Pledge,
      or just donating. Every person and every penny counts!"
  callback = (response) ->
  FB.ui obj, callback
  false

jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  $('#facebook_popup').click ->
    postToFeed()
    false

  # add the tooltips to the Learn More elements
  $(".whatisthis").tooltip({position: 'bottom center', relative: true})

  $("#submit_donation").click ->
    if parseInt($("#card_month").val()) < 6 && $("#card_year").val() == "2012"
      $("#stripe_error").html("Card expiration must be June 2012 or later").show()
      $("#card_month").focus()
      return false
    if ($("#card_number").val().substring(0,2) == "34" || $("#card_number").val().substring(0,2) == "37")
      unless $("#card_code").val().length == 4
        $("#stripe_error").html("American Express card must have a four digit CVC").show()
        $("#card_code").focus()
        return false
    true

#= require stripe

