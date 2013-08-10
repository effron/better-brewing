var initializeEditableTable = function(){

  $(".add-row").on("ajax:success", function(event, data){
    $(event.target).siblings(".editable-table").append(data);
  });

  $(".editable-table").on("ajax:success", ".update-row", function(event, data){
    var id = $(event.target).data("id");
    $(event.target).parents(".editable-row-" + id).replaceWith(data);
    // $(".editable-row-" + id).replaceWith(data);
  });

  $(".editable-table").on("ajax:success", ".edit-row", function(event, data){
    var id = $(event.target).data("id");
    console.log(id)
    $(event.target).parents(".editable-row-" + id).replaceWith(data);
  });

  $(".editable-table").on("ajax:success", ".destroy-row", function(event, data){
    var id = $(event.target).find(".destroy-button").data("id");
    $(event.target).parents(".editable-row-" + id).remove();
  });
}