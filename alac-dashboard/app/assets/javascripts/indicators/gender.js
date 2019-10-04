const URL = window.location.origin

fetch(`${URL}/api/indicators/gender`)
  .then(function(response){
    return response.json()
  })
  .then(function(data){
    drawChart(data)
  })



function drawChart(data){
  let keys = []
  let chartData = []
  Object.keys(data).map(key => {
    keys.push(key)
    chartData.push(data[key])
  })

  const ctx = document.getElementById('gender-chart').getContext('2d');
  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: keys,
      datasets: [{
        label: 'Género',
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