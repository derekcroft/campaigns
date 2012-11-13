#= require facebook
#= require stripe

jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  # set the jquery ui slider up
  $("#display5").slider
    value: $('#pledge_cap').val()
    min: 20
    max: 1000
    step: 5
    slide: (event, ui) ->
      $('#pledge_cap').val(ui.value)

  # enforce the donation limits on the slider text field
  $('#pledge_cap').change ->
    $('#display5').slider('value', @value)
  .blur ->
    amount = parseInt(@value)
    if amount < 20 or amount > 1000
      alert "Your maximum donation must be more than $20 and less than $1,000"
      @value = 20
      @focus()

  # add the tooltips to the Learn More elements
  $(".whatisthis").tooltip({position: 'bottom center', relative: true})

  # manage the instructional text in the donor dot comment
  $(".instructional_text")
    .blur ->
      @value = 'Type a short message' if @value == ''
    .focus ->
      @value = '' if @value == 'Type a short message'
  $("#submit_donation")
    .click ->
      $it = $(".instructional_text")
      $it.val('') if $it.val() == 'Type a short message'

