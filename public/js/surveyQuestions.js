$(document).ready(function(){
        //drop down additional new question forms
  $(document).on("submit", ".addnew", function(e) {
    e.preventDefault();
    $.ajax({
      type: $(this).attr("method"),
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(e) {
      $(".container").find("#replaceable").replaceWith(e);
    }).fail(function(e) {
      alert(e.statusText);});}); 

        //intercept question DELETE function
  $(document).on("submit", ".deleteform", function(e){
    e.preventDefault();
    $.ajax({
      type: "DELETE",
      url: $(this).attr("action"),
    }).done(function(e) {
      $(".container").find(".deletediv").replaceWith("<p></p>");
    }).fail(function(e) {
      alert(e.statusText);});});

       //intercept question EDIT function
  $(document).on("submit", ".editform", function(e){
    e.preventDefault();
    var editform = $(this);
    $.ajax({
      url: editform.attr("action"),
    }).done(function(e) {
      $(document).find(editform).closest(".editdiv").replaceWith(e);
    }).fail(function(e) {
      alert(e.statusText);});});

    //intercept question SAVE function
    $(document).on("submit", ".saveform", function(e){
    e.preventDefault();
    var saveform = $(this);
    $.ajax({
      type: "PUT",
      url: saveform.attr("action"),
      data: saveform.serialize()
    }).done(function(e) {
       $(".container").find(".savediv").replaceWith(e);
    }).fail(function(e) {
      alert(e.statusText);});});


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
      alert(e.statusText);});});   

});

