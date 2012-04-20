$ ->
  $('.popup_link').click ->
    href = $(this).prop('href')
    width = $(this).data('width') || '600'
    newwindow = window.open(href,'name','scrollbars=1,height=400,width='+width)
    newwindow.focus() if window.focus
    false