$ ->
  $('.popup_link').click ->
    href = $(this).prop('href')
    width = $(this).data('width') || '600'
    newwindow = window.open(href,'','scrollbars=1,height=400,width='+width)
    newwindow.focus() if window.focus
    false

  displayContent = (key) ->
    $('.popup_content').each ->
      if key == $(this).data('divkey')
        $(this).show()
      else
        $(this).hide()

  # display a given popup div
  $('.popup_div').click ->
    displayContent $(this).data('divkey')

  # display the proper popup div on loading
  displayContent $('#popupnav').data('default')?.toLowerCase()

