// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery_nested_form
//= require list
//= require_tree .

window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
    var $tr = $(link).closest('tr');
    return $(content).insertBefore($tr);
}

$(function() {
    if ($(".vote_count").length > 0) {
        setTimeout(reloadCounterView, 100);
        setInterval(order, 1000);
    }
})

function reloadCounterView (question_id) {
    for (i = 0; i < $(".vote_count").length; i++) {
        $.getScript("/rooms/" + $("h1").data().roomId + "/questions/" + $(".vote_count")[i].id + "/questions_voters.js?question_id=" + $(".vote_count")[i].id);
    }
    order();
    setTimeout(reloadCounterView, 10000);
}