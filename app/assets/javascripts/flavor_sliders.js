var Sliders = (function(){

  var init = function(selectors){
    _.each(selectors, function(selector){

      makeSlider(selector)
    })
  }

  var makeSlider = function(selector){


  }

  return {
    init: init
  }

})()

var input = $( "#alcohol" );

var slider = $( "<div id='alcohol-slider'></div>" ).insertAfter( input ).slider({
  min: 1,
  max: 6,
  range: "min",
  value: input.val(),
  slide: function( event, ui ) {
    input.val(ui.value - 1);
  }
});

$( "#alcohol").on("change", function() {
  console.log("fired")
  $(this).val(parseInt($(this).val() || 0));
  slider.slider( "value", parseInt($(this).val()) + 1 );
});

$( "#alcohol").on("keyup", function() {
  slider.slider( "value", parseInt($(this).val() || 0) + 1 );
});