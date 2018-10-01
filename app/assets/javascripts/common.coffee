$(document).on "turbolinks:load", -> 
  $('#datepicker, #datepicker1').datepicker({
  		dateFormat: "yy/mm/dd"
  	})
  