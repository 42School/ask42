$('document').ready ->
	$('.btn-answer').on 'click', ->
			$(this).parents("tr").addClass("answered")
  $('.vote').on 'click', ->
    row = $(this).parents("tr:first")
    elt = @parentElement.parentElement.querySelector(".vote_count")
    td = row.children(".votes")
    if @id == 'upvote' && td.children(".upvote-active").length == 0
      if td.children(".downvote-active").length > 0
        td.children(".downvote-active").addClass("downvote").removeClass("downvote-active")
        td.children(".upvote").addClass("upvote-active").removeClass("upvote")
        elt.innerHTML = parseInt(elt.innerHTML, 10) + 2
      else
        td.children(".upvote").addClass("upvote-active").removeClass("upvote")
        elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
    else if @id == 'downvote' && td.children(".downvote-active").length == 0
      if td.children('.upvote-active').length > 0
        td.children(".upvote-active").addClass("upvote").removeClass("upvote-active")
        td.children(".downvote").addClass("downvote-active").removeClass("downvote")
        elt.innerHTML = parseInt(elt.innerHTML, 10) - 2
      else
        td.children(".downvote").addClass("downvote-active").removeClass("downvote")
        elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
    order()

@order = ->
  table = $("table:first tr[data-unanswered]")
  i = 0
  while i < table.length - 1
    if (table[i].querySelector(".vote_count").innerHTML >> 0 < table[i + 1].querySelector(".vote_count").innerHTML >> 0)
      table.eq(i).insertAfter table.eq(i + 1)
    i++


@answered = ->
  unanswered = $("table:first tr:not([data-unanswered])")
  unanswered.addClass("answered")
