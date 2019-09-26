$(document).ready(function(){
  $('#kind_investigation').on('change', function() {
    if(this.value == 'penal'){
      $('.fiscal_stage_options').addClass('hide')
      $('.disciplinary_stage_options').addClass('hide')
      $('.fault_select').addClass('hide')
      $('.disciplinary_situation_options').addClass('hide')
      $('.fiscal_situation_options').addClass('hide')
      $('.penal_stage_options').removeClass('hide')
      $('.penal_situation_options').removeClass('hide')
      $('.crime_select').removeClass('hide')
    }
    else if(this.value == 'fiscal'){
      $('.disciplinary_stage_options').addClass('hide')
      $('.penal_stage_options').addClass('hide')
      $('.penal_situation_options').addClass('hide')
      $('.crime_select').addClass('hide')      
      $('.fault_select').addClass('hide')
      $('.disciplinary_situation_options').addClass('hide')
      $('.fiscal_stage_options').removeClass('hide')
      $('.fiscal_situation_options').removeClass('hide')
    }
    else if(this.value == 'disciplinaria'){
      $('.fiscal_stage_options').addClass('hide')
      $('.fiscal_situation_options').addClass('hide')
      $('.penal_stage_options').addClass('hide')
      $('.penal_situation_options').addClass('hide')
      $('.crime_select').addClass('hide')      
      $('.disciplinary_situation_options').removeClass('hide')
      $('.disciplinary_stage_options').removeClass('hide')
      $('.fault_select').removeClass('hide')
    }
  });
});