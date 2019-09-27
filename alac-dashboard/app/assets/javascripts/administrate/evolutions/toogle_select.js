$(document).ready(function(){
  $('#kind_investigation').on('change', function() {
    if(this.value == 'penal'){
      $('.fiscal_stage_options').addClass('hide')
      $('.disciplinary_stage_options').addClass('hide')
      $('.penal_stage_options').removeClass('hide')
    }
    else if(this.value == 'fiscal'){
      $('.fiscal_stage_options').removeClass('hide')
      $('.disciplinary_stage_options').addClass('hide')
      $('.penal_stage_options').addClass('hide')
    }
    else if(this.value == 'disciplinaria'){
      $('.fiscal_stage_options').addClass('hide')
      $('.disciplinary_stage_options').removeClass('hide')
      $('.penal_stage_options').addClass('hide')
    }
  });
});