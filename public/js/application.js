// $(document).ready(function () {
//   $('#register').on('click', function(e){
//     var link = $(this).attr
//     e.preventDefault();
//     console.log(link)
//       // $.ajax({type: "POST", url: link).done(function(){
//       //     $('#vote').hide()
//       })
//     });
$(document).ready(function () {

	var intercept_form = function(form){

	  $(form).submit(function(e) {
	  	e.preventDefault();
	    $.ajax({
	      type: $(this).attr("method"),
	      url: $(this).attr("action"),
	      data: $(this).serialize()
	        }).done(function(e) {
	          $(form).append(e);
	        }).fail(function(e) {
	         alert(e.statusText);
	        });
	  });
	}

	intercept_form("#newsurvey");


});