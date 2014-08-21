App = {
  initialize: ()->
    console.log 'App init'
    App.cardListener()
    App.getHash()


  toggleTab: (tab)->
    if tab.indexOf('#') > -1
      tabgroup = tab.slice(1);
    else
      tabgroup = tab
      tab = '#' + tab

    if $(tab).length > 0
      $('.card').removeClass('active')
      $(tab).addClass('active')

      $('.tab').addClass('hidden');

      $('[data-tabgroup="' +  tabgroup + '"]').removeClass('hidden');


  cardListener: ->
    $('a.card').on(
        click: (e)->
          tab = $(this).attr('id')
          $('a.card').removeClass('active')
          $(this).toggleClass('active')

          if tab != undefined
            App.toggleTab(tab)
      )

  getHash: ()->
    hash = window.location.hash
    if hash != ''
      App.toggleTab(hash)

}

