$('document').ready ->
	$('.btn-answer').on 'click', ->
		$(this).parents("tr").addClass("answered").removeAttr('data-unanswered')

	$('.vote').on 'click', ->
		row = $(this).parents("tr:first")
		td = row.children(".votes")
		elt = @parentElement.parentElement.querySelector(".vote_count")
		upvote = td.find(".upvote")
		downvote = td.find(".downvote")
		if @id == "upvote" 
			if td.find(".active").length > 0
				elt.innerHTML = parseInt(elt.innerHTML, 10) + 2
			else
				elt.innerHTML = parseInt(elt.innerHTML, 10) + 1
				downvote.toggleClass("active")
		else
			if td.find(".active").length > 0
				elt.innerHTML = parseInt(elt.innerHTML, 10) - 2
			else
				elt.innerHTML = parseInt(elt.innerHTML, 10) - 1
				upvote.toggleClass("active")
		downvote.toggleClass("active")
		upvote.toggleClass("active")
		order()

@QuestionsHandler =
  start: ->
    console.log "Starting"
#    setInterval @pollingCounter, 5000
    setInterval @pollingQuestion, 5000

#  pollingCounter: ->
#    $.getScript("/rooms/" + $("h1").data().roomId + "/questions/" + $(".vote_count")[i].id + "/questions_voters.js?question_id=" + $(".vote_count")[i].id)
#    @orderQuestions

  pollingQuestion: ->
    console.log "polling Question"
    $.getScript($("h1").data('url'), id: Math.max.apply null, $('tr').map(-> $(this).data().id ))

  orderQuestions: ->
    table = $("table:first tr[data-unanswered]")
    i = 0
    while i < table.length - 1
      if (table[i].querySelector(".vote_count").innerHTML >> 0 < table[i + 1].querySelector(".vote_count").innerHTML >> 0)
        table.eq(i).insertAfter table.eq(i + 1)
      i++

  answered: ->
    unanswered = $("table:first tr:not([data-unanswered])")
    unanswered.addClass("answered")

jQuery ->
  if $(".vote_count").length > 0
    console.log "entering first loop"
    QuestionsHandler.start()


#answered();
#setTimeout(reloadCounterView, 10000);



