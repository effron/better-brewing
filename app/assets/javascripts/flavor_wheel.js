var flavorWheel = function(id, names, values, animation){

  var ctx = $(id).get(0).getContext("2d");

  var data = {
    labels: names,
    datasets: [
      {
        fillColor : "rgba(17,15,46,.5)",
  			strokeColor : "rgba(23,22,39,1)",
        data: values
      }
    ]
  }
  var options = {
    scaleOverride: true,

    scaleSteps: 5,
    scaleStepWidth: 1,
    scaleStartValue: 0,
    scaleShowLabels: true,
    animation: animation,
    animationSteps: 45,
    animationEasing: "easeOutBounce"
  }

  new Chart(ctx).Radar(data, options);

}