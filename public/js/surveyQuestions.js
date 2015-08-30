$(document).ready(function(){
          //drop down additional new question forms
        $(document).on("submit", ".addnew", function(e) {
            e.preventDefault();
            var addNew = $(this);
            //Must be in here twice, no idea why that works
            $(document).find("#replaceable").replaceWith("<p></p>");
            $(document).find("#replaceable").replaceWith("<p></p>");
          $.ajax({
              type: addNew.attr("method"),
              url: addNew.attr("action"),
              data: addNew.serialize()
            }).done(function(e) {
              console.log(e);
              // $("#replaceable").html("test")
              // $(addNew).siblings("#replaceable").remove();
              $(".container").append(e);
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
          $.when($(".container").append(e)).done(function(){
            $(".container").children().on("submit", "#addnew", function(e){
              e.preventDefault();
            });
          });
        }).fail(function(e) {
          alert(e.statusText);
        });
    });   
});

