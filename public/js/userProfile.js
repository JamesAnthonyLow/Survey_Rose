 $(document).ready(function() {
  // Create drop down for created surveys in user profile page
  $(".surveys").on('click', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
      data: $(this).serialize()
    }).done(function(e) {
      $(".surveys").after(e);
    }).fail(function(e) {
      alert(e.statusText);
    });
  });
});