jQuery ->
  $("#goldbox input[type=radio]").click ->
    $("#fixedamount").attr("disabled", !$("#donation_type_fixed").is(":checked"))
