$('document').ready ->
	$('.btn-answer').on 'click', ->
		$(this).parents("tr").addClass("answered")

	$('.vote').on 'click', ->
		row = $(this).parents("tr:first")
		td = row.children(".votes")
		elt = @parentElement.parentElement.querySelector(".vote_count")
		if @id == "upvote" 
			if td.children(".active").length > 0
				elt.innerHTML = parseInt(elt.innerHTML, 10) + 2
			else
				elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
				td.children(".downvote").toggleClass("active")
		else
			if td.children('.active').length > 0
				elt.innerHTML = parseInt(elt.innerHTML, 10) - 2
			else
				elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
				td.children(".upvote").toggleClass("active")
		td.children(".downvote").toggleClass("active")
		td.children(".upvote").toggleClass("active")
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
