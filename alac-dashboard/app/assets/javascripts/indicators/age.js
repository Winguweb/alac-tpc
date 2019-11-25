const URL = window.location.origin

fetch(`${URL}/api/indicators/age`)
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

  const ctx = document.getElementById('age-chart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
        labels: keys,
        datasets: [{
            data: chartData,
            backgroundColor: ['#5472d2', '#00c1cf', '#75d69c', '#5472d2', '#00c1cf', '#75d69c', '#5472d2', '#00c1cf', '#75d69c', '#5472d2'],
            borderColor: ['#5472d2', '#00c1cf', '#75d69c', '#5472d2', '#00c1cf', '#75d69c', '#5472d2', '#00c1cf', '#75d69c', '#5472d2'],
            borderWidth: 1
        }],
    },
    options: {
      legend: {
        display: false,
        labels: {
          fontSize: 16
        }
      },
      tooltips: {
        titleFontSize: 16,
        bodyFontSize: 16
      },
        scales: {
            yAxes: [{
                ticks: {
                  fontSize: 16,
                  beginAtZero: true,
                  padding: 1
                }
            }],
            xAxes: [{
              barThickness: 'flex',
              barPercentage: 0.9,
              categoryPercentage: 1,
              ticks: {
                fontSize: 16
              }
          }]
        }
    }
});
}