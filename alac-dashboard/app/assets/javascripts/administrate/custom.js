$(document).ready(function(){
  // Actors form
  // Show charge field when individual actor type is selected
  $('.actors-type-checkbox').click(function(){
    var inputValue = $(this).attr('value');
    if (inputValue === 'individual') {
      $('.actor-charge-field').removeClass('d-none');
    } else {
      $('.actor-charge-field').addClass('d-none');
    };
  });

  // Show text input when 'other' is selected
  $('.actor-charge-select').on('change', function() {
    const selectValue = this.value;
    if (selectValue === 'otro') {
      $('.actor-charge-input').removeClass('d-none');
    } else {
      $('.actor-charge-input').addClass('d-none');
    };
  });

  // Append custom option to select
  $('#actor_position_custom').on('change', function() {
    var inputValue = this.value;
    var selected = $('.actor-charge-select').find('option:selected').val(inputValue);
    console.log(selected.val());
  });

  // Characterizations form
  // Show select when known authority is selected
  $('#characterization_known_authotity_true').click(function() {
    $('.select-known-authority').removeClass('d-none');
  });

  $('#characterization_authority').on('change', function() {
    const value = this.value;
    if (value === 'Otro') {
      $('.known-authority-input').removeClass('d-none');
    }
  });

  // Add custom option to authority
  $('.authority-text-input').on('change', function() {
    var inputValue = this.value;
    var selected = $('#characterization_authority').find('option:selected').val(inputValue);
  });

    // Show select when has_tool is selected
    $('#characterization_has_tool_true').click(function() {
      $('.has-tool-select').removeClass('d-none');
    });
  
    $('#characterization_tool').on('change', function() {
      const value = this.value;
      if (value === 'Otros') {
        $('.has-tool-input').removeClass('d-none');
      }
    });

    $('.entity_tools_select').on('change', function(){
      if(this.value == ''){
        $('.entity_text').removeClass('hide')
      }else{
        $('.entity_text').addClass('hide')
      }
    })

    $('body').on('shown.bs.modal', '#toolModal', function (e) {
      var id = $(e.relatedTarget).data('id');
      
      $('#tool_advisory_id').val(id)
     });

     $('.form-submit').submit(function(){
       location.reload()
     })

     $('.crime-select').on('change', function(){
       let options = $('.crime-select select').val()
       let stringify_options = JSON.stringify(options);
        
       $('#evolution_crime').val(stringify_options)
     })
     
    $('.tool-text-input').on('change', function() {
      var inputValue = this.value;
      var selected = $('#characterization_tool').find('option:selected').val(inputValue);
    });
});