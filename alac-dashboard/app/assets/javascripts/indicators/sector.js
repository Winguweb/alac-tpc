const URL = window.location.origin

fetch(`${URL}/api/indicators/sector`)
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

  const ctx = document.getElementById('sector-chart').getContext('2d');
  new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: keys,
        datasets: [{
            label: '',
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
          fontSize: 24
        }
      },
      tooltips: {
        titleFontSize: 24,
        bodyFontSize: 24
      },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    fontSize: 24,
                    fontStyle: 'bold'
                }
            }],
            xAxes: [{
              ticks: {
                beginAtZero: true,
                fontSize: 24
              }
            }]
        }
    }
});
}