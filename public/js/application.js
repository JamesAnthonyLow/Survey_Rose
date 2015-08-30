$(document).ready(function(){
        $(document).on("submit", "#addnew", function(e) {
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

     $("#newsurveyform").submit(function(e) {
        e.preventDefault();
      $.ajax({
          type: $(this).attr("method"),
          url: $(this).attr("action"),
          data: $(this).serialize()
        }).done(function(e) {
         $(".container").append(e);
            });
          });
        }).fail(function(e) {
          alert(e.statusText);
        });
    });   
});

