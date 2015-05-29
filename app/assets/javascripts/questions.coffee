$('document').ready ->
  $('.vote').on 'click', ->
    location.reload()
    row = $(this).parents("tr:first")
    elt = @parentElement.parentElement.querySelector(".vote_count")
    if @id == 'upvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
    else if @id == 'downvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
    order()

@order = ->
  table = $("table:first tr")
  i = 0
  while i < table.length - 1
    if table[i].querySelector(".vote_count").innerHTML >> 0 < table[i + 1].querySelector(".vote_count").innerHTML >> 0
      table.eq(i).insertAfter table.eq(i + 1)
    i++
