var animateChart = function(data, options, chart, speed){
  speed = speed || 200
  chart.draw(google.visualization.arrayToDataTable(data.slice(0,2)), options);
  chart.draw(google.visualization.arrayToDataTable(data.slice(0,3)), options);

  _.times(data.length - 3, function(n){
    var tableData = google.visualization.arrayToDataTable(data.slice(0, n + 4));
    setTimeout(function(){
      chart.draw(tableData, options)
    }, (n+1)* speed)
  })
}
