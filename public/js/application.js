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
  $("#newsurvey").submit(function(e) {
  	e.preventDefault();
    $.ajax({
      type: "post",
      url: "/users/surveys",
      data: $(this).serialize()
        }).done(function(e) {
          $('#newsurvey').append(e);
        }).fail(function(e) {
         alert(e.statusText);
        });
  });
});