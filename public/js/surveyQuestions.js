$(document).ready(function(){
          //drop down additional new question forms
        $(document).on("submit", ".addnew", function(e) {
            e.preventDefault();
            var addNew = $(this);
          $.ajax({
              type: addNew.attr("method"),
              url: addNew.attr("action"),
              data: addNew.serialize()
            }).done(function(e) {
            $(".container").find("#replaceable").replaceWith(e);
              // $(".container").append(e);
            }).fail(function(e) {
              alert(e.statusText);
            });
        });  

        //save survey name and dropdown new question form
     $("#newsurveyform").submit(function(e) {
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

