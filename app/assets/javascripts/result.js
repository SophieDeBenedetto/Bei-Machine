$(function(){
  moreListener();
  submitNotesListener();
  deleteResultListener();
});

function moreListener(){
  $("table").on("click", ".notes-btn", showNotes);
}

function showNotes(){
  // debugger;
  var id = $(this).attr("id").slice(4);
  $("#notes-"+id).fadeToggle("slow");
  $("#notes").toggleClass("hidden_notes");
}

function submitNotesListener(){
  $(".edit_bee").on("submit", submitNotesHandler)
}

function submitNotesHandler(e){
  e.preventDefault();
  e.stopPropagation();
  var num = $(this).attr("action").slice(6);
  var url = $(this).attr("action");
  var method = $(this).attr("method");
  var data = $(this).serialize();
  // debugger;
  $.ajax(url, {
    method: method,
    data: data,
    complete: function(response, id){
      // debugger;
      $("#notes-"+num).fadeToggle("slow");
      

    } 
  });
}

function deleteResultListener(){
   $("table").on("click", ".delete-btn", deleteResult);
}

function deleteResult(e){
  var ID = $(this).attr("id").slice(7);
  $("#"+ID).fadeOut(250);

}















