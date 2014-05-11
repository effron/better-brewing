var FlavorWheel = (function(){
  var Wheel = function(canvasId, names, values, customOptions){

    this.canvasId = canvasId;
    this.names = names;
    this.values = values;
    this.customOptions = customOptions

    var ctx, data, container, canvas;

    this.init = function(){
      container = $(canvasId).parent();
      canvas = $(canvasId)[0];
      ctx = $(canvasId).get(0).getContext("2d");

      data = parseInfo(names, values);

      this.bindEvents();      

      this.draw(this.customOptions);
    };

    this.off = function(){
      $(window).off('resize', container)
    }

    this.bindEvents = function(){
      var that = this
      $(window).on('resize', container, that.redrawWithoutAnimation.bind(that))
    }

    this.draw = function(customOptions){

      var that = this;
      var width = container.width();
      canvas.width = width;
      canvas.height = width;

      var options = {
        scaleOverride: true,
        scaleSteps: 5,
        scaleStepWidth: 1,
        scaleStartValue: 0,
        scaleShowLabels: true,
        animation: true,
        animationSteps: 45,
        animationEasing: "easeOutBounce"
      };

      $.extend(options, customOptions)

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

    this.redrawWithoutAnimation = function(){
      var that = this;
      var settings = $.extend({}, that.customOptions, {animation: false});

      that.draw(settings);
    };
  }

  return {
    Wheel: Wheel
  }
})()
