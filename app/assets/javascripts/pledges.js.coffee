jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }
  $('.positive-decimal').numeric { decimal: '.', negative: false }

  $('.positive-decimal')
    .keyup ->
      invalidDecimal = /\.\d{3,}$/
      @value = @value.slice(0, -1) if invalidDecimal.test(@value)
      cascade()

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
    amount = parseFloat $('#pledge_amount').val()
    if isNaN(amount) then 0.00 else amount

  cascadeMatchAmount = ->
    $('.pledge_amount').html(pledgeAmount().toFixed(2)).val(pledgeAmount().toFixed(2))
    $('.pledge_cap').html(pledgeCap().toFixed(2)).val(pledgeCap().toFixed(2))

  cascadeStretchGoalAmount = ->
    amount = (pledgeCap() * 0.25).toFixed(2)
    $('.pledge_stretch_goal_amount').html(amount).val(amount)

  cascadeDonateBonus = ->
    checked = if $('#pledge_donate_bonus').is(':checked') then 'Yes' else 'No'
    $('.pledge_donate_bonus').html checked

  cascadeDonateCap = ->
    checked = if $('#pledge_donate_cap').is(':checked') then 'Yes' else 'No'
    $('.pledge_donate_cap').html checked

  cascade = ->
    cascadeMatchAmount()
    cascadeStretchGoalAmount()
    cascadeDonateBonus()
    cascadeDonateCap()

  validatePledgeAmount = (event) ->
    if pledgeAmount() < 0.02
      alert "Please enter a match amount of at least 2 cents."
      $(@).val('0.02').focus()
      cascade()
      event.stopImmediatePropagation()

  $('#pledge_amount')
    .on('change', validatePledgeAmount)
    .on('keyup', cascadeMatchAmount)
    .on('paste', cascadeMatchAmount)
    .on('change', cascadeStretchGoalAmount)
  $('#pledge_donate_bonus')
    .on('change', cascadeDonateBonus)
  $('#pledge_donate_cap')
    .on('change', cascadeDonateCap)
  cascade()
