var initializeEditableTable = function(){

  $(".add-row").on("ajax:success", function(event, data){
    $(event.target).siblings(".editable-table").append(data);
  });

  $(".editable-table").on("ajax:success", ".update-row", function(event, data){
    var id = $(event.target).data("id");
    $("#editable-row-" + id).replaceWith(data);
  });

  $(".editable-table").on("ajax:success", ".edit-row", function(event, data){
    var id = $(event.target).data("id");
    $("#editable-row-" + id).replaceWith(data);
  });

  $(".editable-table").on("ajax:success", ".destroy-row", function(event, data){
    var id = $(event.target).find(".destroy-button").data("id");
    console.log(id);
    $("#editable-row-" + id).remove();
  });
}