#= require stripe

jQuery ->
  # only allow numbers in the fixed amount text field
  #$('.positive-integer').numeric { decimal: false, negative: false }

  # add the tooltips to the Learn More elements
  #$(".whatisthis").tooltip({position: 'bottom center', relative: true})

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
