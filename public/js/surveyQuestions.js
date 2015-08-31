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
      $("html, body").animate({ 
        scrollTop: $(document).find(".addnew").offset().top 
      });
    }).fail(function(e) {
      alert(e.statusText);});}); 

    //intercept question DELETE function
  $(document).on("submit", ".deleteform", function(e){
    e.preventDefault();
    deleteform = $(this);
    $.ajax({
      type: "DELETE",
      url: deleteform.attr("action"),
    }).done(function(e) {
      $(document).find(deleteform).closest(".deletediv").replaceWith("<p></p>");
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
       $(document).find(".savediv").replaceWith(e);
    }).fail(function(e) {
      alert(e.statusText);});});

    //make sure last question saves
  $(document).on("submit", "#saveall", function(e){
    $.ajax({
      type: $(document).find(".addnew").attr("method"),
      url: $(document).find(".addnew").attr("action"),
      data: $(document).find(".addnew").serialize()
    }).fail(function(e) {
      alert(e.statusText);});});

    //save survey name and dropdown new question form
  $("#newsurveyform").submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: $(this).attr("method"),
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(data) {
      $(".container").append(data);
      $("html, body").animate({ scrollTop: $(document).find(".addnew").offset().top });
    }).fail(function(e) {
      alert(e.statusText);});});   

});

