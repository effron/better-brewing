var FlavorWheel = (function(){
  var Wheel = function(canvasId, names, values, animation){

    this.canvasId = canvasId;
    this.names = names;
    this.values = values;
    this.animation = animation;

    var ctx, data, options, container, canvas;

    this.init = function(){
      container = $(canvasId).parent();
      canvas = $(canvasId)[0];
      ctx = $(canvasId).get(0).getContext("2d");

      data = parseInfo(names, values);

      bindEvents();
      resizeCanvas();
      draw(true);
    };

    this.off = function(){
      $(window).off('resize', container)
    }

    var bindEvents = function(){
      $(window).on('resize', container, resizeCanvas)
      console.log(container)
    }

    var draw = function(animation){
      options = {
        scaleOverride: true,
        scaleSteps: 5,
        scaleStepWidth: 1,
        scaleStartValue: 0,
        scaleShowLabels: true,
        animation: animation,
        animationSteps: 45,
        animationEasing: "easeOutBounce"
      };

      new Chart(ctx).Radar(data, options);
    }

    var parseInfo = function(names, values){
      return {
        labels: names,
        datasets: [
          {
            fillColor : "rgba(0,57,143,.5)",
      			strokeColor : "rgba(22,39,65,1)",
            data: values
          }
        ]
      };
    }

    var resizeCanvas = function(){
      var width = container.width();
      canvas.width = width;
      canvas.height = width;
      draw(false);
    };
  }

  return {
    Wheel: Wheel
  }
})()