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
  pledgeCap = ->
    base = $('#pledge_amount').data('goal')
    pledgeAmount() * base

  pledgeAmount = ->
    amount = $('#pledge_amount').val()
    parseFloat amount

  cascadeMatchAmount = ->
    $('.pledge_cap').html(pledgeCap().toFixed(2))

  cascadeStretchGoalAmount = ->
    $('#stretch_goal_amount').html('$' + (pledgeCap() * 0.25).toFixed(2))

  validatePledgeAmount = (event) ->
    if pledgeAmount() < 0.02
      alert "Please enter a match amount of at least 2 cents."
      $(@).val('0.02').focus()
      cascadeMatchAmount()
      cascadeStretchGoalAmount()
      event.stopImmediatePropagation()

  $('#pledge_amount')
    .on('change', validatePledgeAmount)
    .on('keyup', cascadeMatchAmount)
    .on('paste', cascadeMatchAmount)
    .on('change', cascadeStretchGoalAmount)
  cascadeMatchAmount()
  cascadeStretchGoalAmount()
