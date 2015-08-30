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
          $.when($(".container").append(e)).done(function(){
            $(".container").children().on("submit", "#addnew", function(e){
              e.preventDefault();
              alert("god damn!");
            });
          });
        }).fail(function(e) {
          alert(e.statusText);
        });
    });   
  // }
  // Create drop down for created surveys in user profile page
  $(".surveys").on('click', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
      data: $(this).serialize()
    }).done(function(e) {
      $(".surveys").after(e);
    }).fail(function(e) {
      console.log('WTF');
    });
  });
});

