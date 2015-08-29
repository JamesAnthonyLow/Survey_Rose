$(document).ready(function () {
      var addquestion = function() {
      $(document).ready(function() {
        $("#addnew").on("submit", function(e) {
        		e.preventDefault();
          $.ajax({
          		type: $(this).attr("method"),
          		url: $(this).attr("action"),
          		data: $(this).serialize()
            }).done(function(e) {
              $(".container").append(e);
            }).fail(function(e) {
              alert(e.statusText);
            });
        });	
        });  
      }

  // var intercept_form_and_append = function(form, div){
  //      if(div == undefined) { var div = form; };
     $("#newsurveyform").on("submit", function(e) {
        e.preventDefault();
      $.ajax({
          type: $(this).attr("method"),
          url: $(this).attr("action"),
          data: $(this).serialize()
        }).done(function(e) {
          $(".container").append(e);
        }).fail(function(e) {
          alert(e.statusText);
        });
    });   
  // }

  // intercept_form_and_append("#newsurveyform", ".container");


});
// $(document).ready(function () {

// 	  $("#addnew").submit(function(e) {
// 	  		e.preventDefault();
// 	    $.ajax({ 
//       		type: $(this).attr("method"),
//       		url: $(this).attr("action"),
//       		data: $(this).serialize()
//         }).done(function(e) {
//           $("#newquestiondiv").append(e.responseText);
//         }).fail(function(e) {
//           alert(e.statusText);
//         });
// 	  });
// });
