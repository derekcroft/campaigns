#= require stripe
#= require facebook



jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  $('.popup_link').click ->
    href = $(this).prop('href')
    newwindow = window.open(href,'name','scrollbars=1,height=400,width=600')
    newwindow.focus() if window.focus
    false
