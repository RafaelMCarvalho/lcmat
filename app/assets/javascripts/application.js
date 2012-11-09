// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap


//
// Index search
//

$(function(){
  $('.dropdown-menu.with-search input').keyup(function(){
    var text = $(this).val().toLowerCase();

    $(this).parents('.dropdown-menu.with-search:first').find('li:not(:first-child)').each(function(){
      if($(this).text().toLowerCase().indexOf(text) === -1)
        $(this).slideUp();
      else
       $(this).slideDown();
    });
  });
})