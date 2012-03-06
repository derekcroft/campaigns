jQuery ->
  $("#goldbox input[type=radio]").click ->
    $("#fixedamount").prop('disabled', !$("#donation_type_fixed").is(":checked"))
