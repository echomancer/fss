# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

row_click = ->
	window.location = $(this).data('href');
	return false;

ready = ->
	$('tr').on('click', row_click);

$(document).ready(ready);
$(document).on('page:load', ready);