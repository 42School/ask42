$('document').ready ->
  $('.edit').on 'click', ->
    elt = $(this).parents("tr").find(".editable")
    edit = $(this).parents("tr").find('.editing-name')
    elt.addClass("hidden")
    edit.find("#editing").value = elt.innerHTML
    edit.removeClass("hidden")
    $(this).addClass("disabled")
    edit.find(".form-group").find("input").focus()

  $('.saving').on 'click', ->
    elt = $(this).closest("td").find(".editable")
    edit = $(this).closest("td").find('.editing-name')
    debugger
    elt.removeClass("hidden")
    elt.find(".edited").html(edit.find(".form-group").find("input").val())
    edit.addClass("hidden")
    edit.closest("tr").find(".edit").removeClass("disabled")
