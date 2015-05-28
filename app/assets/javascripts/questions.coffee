$('document').ready ->
  $('.vote').on 'click', ->
    location.reload()
    row = $(this).parents("tr:first")
    elt = @parentElement.parentElement.querySelector(".vote_count")
    if @id == 'upvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
    else if @id == 'downvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
    $('table tr').each (index, tr) ->
      if $(tr).find('.vote_count').html() >> 0 > elt.innerHTML >> 0
        row.insertAfter tr
        return



