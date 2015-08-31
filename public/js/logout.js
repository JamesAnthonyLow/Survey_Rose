$(function() {
    $("#logout-link").on('click', function(e) {
    e.preventDefault();

    $.ajax($(e.target).attr('href'), {
      method: "POST",
      data: {
        _method: "DELETE"
      },
      }).then(function() {
      });
  });
});
