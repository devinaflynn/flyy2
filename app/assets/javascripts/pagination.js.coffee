jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->

      console.log('scrolling called ...')
      url = $('.pagination a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $.getScript url
    $(window).scroll()