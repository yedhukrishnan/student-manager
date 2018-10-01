$(document).on "turbolinks:load", -> 
  $('#datepicker').datepicker({
  		dateFormat: "yy/mm/dd"
  	})
  return