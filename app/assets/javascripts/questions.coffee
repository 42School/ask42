$('document').ready ->
  $('.vote').on 'click', ->
    row = $(this).parents("tr:first")
    elt = @parentElement.parentElement.querySelector(".vote_count")
    if @innerHTML == 'Upvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
    else if @innerHTML == 'Downvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
    $('table tr').each (index, tr) ->
      if $(tr).find('.vote_count').html() >> 0 > parseInt(elt.innerHTML, 10)
        row.insertAfter tr
    return



