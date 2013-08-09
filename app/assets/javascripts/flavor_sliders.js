var FlavorSlider = (function(){

  var init = function(selectors){
    _.each(selectors, function(selector){

      makeSlider(selector)
    })
  };

  var makeSlider = function(selector){
    var input = $(selector);
    var input_name = selector.slice(1)
    var slider = $("<div id='" + input_name + "-slider'></div>").insertAfter(input).slider({
      min: 1,
      max: 6,
      range: "min",
      value: input.val(),
      slide: function(event, ui) {
        input.val(ui.value - 1);
      }
    });

    input.on("change", function() {
      $(this).val(parseInt($(this).val() || 0));
      slider.slider( "value", parseInt($(this).val()) + 1 );
    });

    input.on("keyup", function() {
      slider.slider( "value", parseInt($(this).val() || 0) + 1 );
    });

  };

  return {
    init: init
  }

})()