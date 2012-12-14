# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$('a[data-remote]')
	.bind 'ajax:complete', (evt, xhr, status) ->
		console.log $(this).data('id')
		#$( 'tr#tr' + $(this).data('id') ).fadeOut();
		$(this).closest('tr').fadeOut()
		$('.footable-row-detail').remove()

	$('.footable').footable()
