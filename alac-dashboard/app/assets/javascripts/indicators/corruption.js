const URL = window.location.origin

fetch(`${URL}/api/indicators/corruption`)
  .then(function(response){
    return response.json()
  })
  .then(function(data){
    drawChart(data)
    
  })



function drawChart(data){
  let keys = []
  let chartData = []
  let colorBars = []
  data.map( d => {
    const key = Object.keys(d)[0]
    const color = data.indexOf(d) % 2 === 0 ? '#5472d2' : '#00c1cf'

    keys.push(key)
    chartData.push(d[key])
    colorBars.push(color)
  })

  



  const ctx = document.getElementById('corruption-chart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
        labels: keys,
        datasets: [{
            data: chartData,
            backgroundColor: colorBars,
            borderColor: colorBars,
            borderWidth: 1
        }]
    },
    options: {
      legend: {
        display: false,
        labels: {
          fontSize: 28
        }
      },
      tooltips: {
        titleFontSize: 28,
        bodyFontSize: 28
      },
        scales: {
            yAxes: [{
                ticks: {
                    fontSize: 28,
                    beginAtZero: true
                }
            }],
            xAxes: [{
              ticks: {
                  fontSize: 28,
                  fontStyle: 'bold',
              }
          }]
        }
    }
});
}