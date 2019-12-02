const URL = window.location.origin

fetch(`${URL}/api/indicators/rights_violated`)
  .then(function(response){
    return response.json()
  })
  .then(function(data){
    drawChart(data)
  })




function drawChart(data) {
  let keys = []
  let chartData = []
  let totalCases = 0
  let barsColors = []

  data.map((d) => {
    const key = Object.keys(d)[0]
    const value = d[key]
    const color = data.indexOf(d) % 2 === 0 ? '#5472d2' : '#00c1cf'

    keys.push(key)
    chartData.push(value)
    totalCases = totalCases + value
    barsColors.push(color)
  })
    

  const ctx = document.getElementById('rights-chart').getContext('2d');
  new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: keys,
      datasets: [{
        data: chartData,
        backgroundColor: barsColors,
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