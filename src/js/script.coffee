App = {
  initialize: ()->
    App.cardListener()
    App.getHash()
    App.navbarListener()

  toggleTab: (tab)->
    # console.log 'show ', tab
    if tab.indexOf('#') > -1
      tabgroup = tab.slice(1);
    else
      tabgroup = tab
      tab = '#' + tab

    if $('a[href='+tab+']').length > 0
      $('.card').removeClass('active')
      $('a[href='+tab+']').addClass('active')

      $('.tab').addClass('hidden');

      $('[data-tabgroup="' +  tabgroup + '"]').removeClass('hidden');


  cardListener: ->
    $('a.card:not(.home)').on(
        click: (e)->
          tab = $(this).attr('href')
          $('a.card').removeClass('active')
          $(this).toggleClass('active')

          if tab != undefined
            App.toggleTab(tab)
      )

    $('a.card.home').on(
      hover: (e)->
        # console.log 'hover'
      )

  getHash: ()->
    hash = window.location.hash
    if hash != ''
      App.toggleTab(hash)
    # hashchange cardListener
    $(window).hashchange( ()->
        newHash = window.location.hash
        App.toggleTab(newHash)
      )

  navbarListener: ()->
    $('.navbar-toggle').on(
        click: (e)->
          e.preventDefault
          $('.navigation').toggle()

      )



}

App.initialize()

