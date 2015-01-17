jQuery ->
  if $('.pagination').length
    $(window).on 'scroll', ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more startups...")
        $.getScript(url)
    $(window).scroll()
