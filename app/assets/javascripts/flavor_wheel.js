var flavorWheel = function(id, names, values){

  var ctx = $(id).get(0).getContext("2d");

  var data = {
    labels: names,
    datasets: [
      {
        fillColor : "rgba(214,224,255,0.5)",
  			strokeColor : "rgba(220,220,220,1)",
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
    animationSteps: 45,
    animationEasing: "easeOutBounce"
  }

  new Chart(ctx).Radar(data, options);

}