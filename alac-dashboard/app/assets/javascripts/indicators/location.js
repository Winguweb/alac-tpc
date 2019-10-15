const URL = window.location.origin

fetch(`${URL}/api/indicators/location`)
  .then(function(response){
    return response.json()
  })
  .then(function(data){
    drawChart(data)
  })



function drawChart(data){
  let keys = []
  let chartData = []
  let totalCases = 0
  Object.keys(data)
    .sort((a, b) => a > b )
    .map(key => {
    keys.push(key)
    chartData.push(data[key])
    totalCases = totalCases + data[key]
    })
    


  const ctx = document.getElementById('location-chart').getContext('2d');
  new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: keys,
      datasets: [{
        data: chartData,
        backgroundColor: ['#5472d2', '#00c1cf', '#75d69c'],
        borderColor: 'rgba(54, 162, 235, 0.8)',
        borderWidth: 1
      }]
    },
    options: {
      legend: {
        display: false
      },
      tooltips: {
        titleFontSize: 28,
        bodyFontSize: 28
      },
      scales: {
          xAxes: [{
            scaleFontSize: 28,
              ticks: {
                  fontSize: 28,
                  beginAtZero: true,
                  max: totalCases,
                  callback: function(value) {
                    return (value / totalCases * 100).toFixed(0) + '%'; // convert it to percentage
                  },   
              }
          }],
          yAxes: [{
              ticks: {
                  fontSize: 28
              }
          }]
      }
    }
  });
}