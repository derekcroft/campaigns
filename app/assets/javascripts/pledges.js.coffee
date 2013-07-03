jQuery ->
  ## only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }
  $('.positive-decimal')
    .numeric(decimal: '.', negative: false)
    .keyup ->
      invalidDecimal = /\.\d{3,}$/
      @value = @value.slice(0, -1) if invalidDecimal.test(@value)
      cascade()

  ## manage the instructional text in the donor dot comment
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

  ## filter the charities by sport
  $pledge_team_id = $('#pledge_team_id')
  $('#sport').on 'change', ->
    $pledge_team_id.empty()
    options = $pledge_team_id.prop 'options'
    options[0] = new Option('Choose A Team/Charity')
    if @value
      $.each window.teamsBySport[@value], (idx, val) ->
        options[options.length] = new Option(val.description, val.team_id)
    else
      $.each window.teamsAll, (idx, val) ->
        options[options.length] = new Option(val.description, val.team_id)

  ## don't submit if user hasn't selected a charity
  $('#submit_donation').on 'submit', ->
    unless $('#pledge_team_id').val()
      alert 'You must select a charity to support before submitting your donation.'
      $('#pledge_team_id').focus()
      false

  ## cascade changes to match amount to the rest of the page
  pledgeCap = ->
    base = $('#pledge_amount').data('goal')
    pledgeAmount() * base

  pledgeAmount = ->
    amount = parseFloat $('#pledge_amount').val()
    if isNaN(amount) then 0.00 else amount

  cascadeMatchAmount = ->
    amount = pledgeAmount().toFixed(2)
    cap = pledgeCap().toFixed(2)
    $('.pledge_amount').html(amount).val(amount)
    $('.pledge_cap').each (elem, obj) ->
      # try/catch because IE8 is a douche
      try $(obj).html(cap) catch e
      try $(obj).val(cap) catch e

  cascadeStretchGoalAmount = ->
    amount = (pledgeCap() * 0.25).toFixed(2)
    obj = $('.pledge_stretch_goal_amount')
    # try/catch because IE8 is a douche
    try obj.html(amount) catch e
    try obj.val(amount) catch e

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
    .on('blur', validatePledgeAmount)
    .on('keyup', cascadeMatchAmount)
    .on('paste', cascadeMatchAmount)
    .on('change', cascadeStretchGoalAmount)
  $('#pledge_donate_bonus')
    .on('change', cascadeDonateBonus)
  $('#pledge_donate_cap')
    .on('change', cascadeDonateCap)
  cascade()
