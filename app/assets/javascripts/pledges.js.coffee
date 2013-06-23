jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }
  $('.positive-decimal').numeric { decimal: '.', negative: false }

  # manage the instructional text in the donor dot comment
  prompt = 'Type a short message'
  $it = $('.instructional_text')
  $it
    .blur ->
      @value = prompt if @value is ''
    .focus ->
      @value = '' if @value is prompt
  $("#submit_donation")
    .click ->
      $it.val('') if $it.val() is prompt
  $it.val(prompt) unless $it.val()

