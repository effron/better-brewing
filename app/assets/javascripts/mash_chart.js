var MashChart = (function(){

  var options, chart, data;

  var init = function(noteData, chartId){
    options = {
      title: 'Time vs. Temperature',
      hAxis: {title: 'Time (minutes)', minValue: 0, maxValue: 60 },
      vAxis: {title: 'Temperature (Fahrenheit)', minValue: 100, maxValue: 200},
      legend: 'none',
      lineWidth: 1,
      animation: {duration: 250, easing: "linear"}
    };

    chart = new google.visualization.
                  ScatterChart($(chartId)[0]);

    data = parseNoteData(noteData);

    if (data.length > 1){
      animateChart(data, options, chart, 300)
    }
    else {
      $(chartId).append("<p>Add some mash notes</p>")
    }

  }

  var parseNoteData = function(noteData){
    noteData = _.map(noteData, function(mash_note){
      return [mash_note.time, mash_note.temperature];
    });
    // filter out undefined points
    noteData = _.select(noteData, function(note){
      return note[0] != undefined && note[1] != undefined;
    });

    //sort by time
    noteData = _.sortBy(noteData, function(note){
      return note[0];
    });
    // Add first row
    noteData.unshift(["Time", "Temperature"]);

    return noteData;
  }

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

  return {
    init: init
  }
})()