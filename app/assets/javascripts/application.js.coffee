//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap/bootstrap-tooltip

jQuery ->
  $('.dropdown').click(() ->
    $('.dropdown-menu').toggle())

$("a[rel='tooltip']").tooltip({position: 'bottom'});