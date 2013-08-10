var FlavorWheel = (function(){
  
  var ctx, data, options;
  
  var init = function(canvasId, names, values, animation){
    ctx = $(canvasId).get(0).getContext("2d");
    
    data = parseInfo(names, values);
    
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
          fillColor : "rgba(17,15,46,.5)",
    			strokeColor : "rgba(23,22,39,1)",
          data: values
        }
      ]
    };
  }
  
  return {
    init: init
  }  
})()