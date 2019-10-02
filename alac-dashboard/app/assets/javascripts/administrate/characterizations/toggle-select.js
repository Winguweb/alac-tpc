$(document).ready(function(){
  $('.corruption-select').on('change', function() {
    if(this.value == 'Corrupción judicial'){
      $('.judicial-corruption-select').removeClass('hide')
      $('.administrative-corruption-select').addClass('hide')
      $('.political-corruption-select').addClass('hide')
      $('.private-corruption-select').addClass('hide')
    } else if (this.value == 'Corrupción administrativa') {
      $('.administrative-corruption-select').removeClass('hide')
      $('.judicial-corruption-select').addClass('hide')
      $('.political-corruption-select').addClass('hide')
      $('.private-corruption-select').addClass('hide')
    } else if (this.value === 'Corrupción política') {
      $('.political-corruption-select').removeClass('hide')
      $('.judicial-corruption-select').addClass('hide')
      $('.administrative-corruption-select').addClass('hide')
      $('.private-corruption-select').addClass('hide')
    } else if (this.value === 'Corrupción privada') {
      $('.private-corruption-select').removeClass('hide')
      $('.judicial-corruption-select').addClass('hide')
      $('.administrative-corruption-select').addClass('hide')
      $('.political-corruption-select').addClass('hide')
    }
  })
})