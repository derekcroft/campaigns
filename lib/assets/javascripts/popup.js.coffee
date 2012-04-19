$ ->
  $('.popup_link').click ->
    href = $(this).prop('href')
    newwindow = window.open(href,'name','scrollbars=1,height=400,width=600')
    newwindow.focus() if window.focus
    false