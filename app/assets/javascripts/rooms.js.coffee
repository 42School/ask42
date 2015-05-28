$('document').ready ->
  $('.edit').on 'click', ->
    elt = $(this).parent().parent().parent().find(".editable")
    edit = $(this).parent().parent().parent().find('.editing-name')
    elt.addClass("hidden")
    edit.find("#editing").value = elt.innerHTML
    edit.removeClass("hidden")
    $(this).addClass("disabled")
    edit.find(".form-group").find("input").focus()
    return
  $('.saving').on 'click', ->
    elt = $(this).closest("td").find(".editable")
    edit = $(this).closest("td").find('.editing-name')
    elt.removeClass("hidden")
    elt.html(edit.find(".form-group").find("input").val())
    edit.addClass("hidden")
    edit.closest("tr").find(".edit").removeClass("disabled")
    return
  return
