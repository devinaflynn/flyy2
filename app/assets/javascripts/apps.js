// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//$(document).bind('ajaxSuccess',function() {console.log('ajax done');});
$(document).ready(function(){

console.log($('a[data-remote="true"]').length);
	$('a[data-remote="true"]').on('ajax:success', function(event, data) {
		//alert("success");
	  var link = $(this);
	console.log(link.data('id'));
	  var btn	= $('.btn'+link.data('id'));
	  btn.html(data.votes);
	});


})