$('document').ready ->
  $('.vote').on 'click', ->
    row = $(this).parents("tr:first")
    elt = @parentElement.parentElement.querySelector(".vote_count")
    if @id == 'upvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
    else if @id == 'downvote'
      elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
    $('table tr').each (index, tr) ->
      if $(tr).find('.vote_count').html() >> 0 > elt.innerHTML >> 0
        row.insertAfter tr

refresh_counter = ->
  calculate_total counter for counter in $(".vote_count")

calculate_total = (counter) ->
  total = eval(eval(counter.dataset.votes).join("+"))
  counter.innerHTML = total

setInterval ->
    refresh_counter()
  , 1000

