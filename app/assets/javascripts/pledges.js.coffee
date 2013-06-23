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

  # cascade changes to match amount to the rest of the page
  base = 500
  cascadeMatchAmount = ->
    $amount = $('#pledge_amount').val()
    if $amount.length == 0
      document.getElementById('mpdresult').innerHTML = ''
      return
    number = parseFloat $amount
    return if isNaN(number)
    document.getElementById('mpdresult').innerHTML = number * base

  $('#pledge_amount')
    .on('keyup', cascadeMatchAmount)
    .on('paste', cascadeMatchAmount)
  cascadeMatchAmount()
