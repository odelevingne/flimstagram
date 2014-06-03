# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	$('.like-btn').on('click', function(event){
	event.preventDefault();
	$.post(this.href);
	})
})