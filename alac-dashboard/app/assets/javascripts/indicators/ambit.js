const URL = window.location.origin

fetch(`${URL}/api/indicators/ambit`)
  .then(function(response){
    return response.json()
  })
  .then(function(data){
    drawChart(data)
  })



function drawChart(data){
  let keys = []
  let chartData = []
  data.map( d => {
    const key = Object.keys(d)[0]
    keys.push(key)
    chartData.push(d[key])
  })

  const ctx = document.getElementById('ambit-chart').getContext('2d');
  new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: keys,
        datasets: [{
            label: '# of Votes',
            data: chartData,
            backgroundColor: 'rgba(54, 162, 235, 0.8)',
            borderColor: 'rgba(54, 162, 235, 0.8)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }],
            xAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
        }
    }
});
}