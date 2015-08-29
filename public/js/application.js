$(document).ready(function () {

	  $("#newsurveyform").submit(function(e) {
	  		e.preventDefault();
	    $.ajax({
      		type: $(this).attr("method"),
      		url: $(this).attr("action"),
      		data: $(this).serialize()
        }).done(function(e) {
          $("#newquestiondiv").append(e);
        }).fail(function(e) {
          alert(e.statusText);
        });
	  });	  

	  $("#addnew").submit(function(e) {
	  		e.preventDefault();
	    $.ajax({ 
      		type: $(this).attr("method"),
      		url: $(this).attr("action"),
      		data: $(this).serialize()
        }).done(function(e) {
          $("#newquestiondiv").append(e.responseText);
        }).fail(function(e) {
          alert(e.statusText);
        });
	  });
});