const URL = window.location.origin

fetch(`${URL}/api/indicators/occupation`)
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
  Object.keys(data).map(key => {
    keys.push(key)
    chartData.push(data[key])
    const color = Object.keys(data).indexOf(key) % 2 === 0 ? '#5472d2' : '#00c1cf'
    colorBars.push(color)
  })

  const ctx = document.getElementById('occupation-chart').getContext('2d');
  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: keys,
      datasets: [{
        label: 'Ocupación',
        data: chartData,
        backgroundColor: ['#5472d2', '#00c1cf', '#75d69c'],
        borderColor: 'rgba(54, 162, 235, 0.8)',
        borderWidth: 1
      }]
    },
    options: {
      animation: {
        animateRotate: true
      },
      legend: {
        labels: {
          fontSize: 28
        }
      },
      tooltips: {
        bodyFontSize: 28
      }
    }
  });
}