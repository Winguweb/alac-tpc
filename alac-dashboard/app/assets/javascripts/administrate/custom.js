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
  $('#true_known_authority').click(function() {
    $('.select-known-authority').removeClass('d-none');
  });

  $('.known-authority').on('change', function() {
    const value = this.value;
    if (value === 'otro') {
      $('.known-authority-input').removeClass('d-none');
    }
  });

    // Show select when has_tool is selected
    $('#true_has_tool').click(function() {
      $('.has-tool-select').removeClass('d-none');
    });
  
    $('.has-tool').on('change', function() {
      const value = this.value;
      if (value === 'otro') {
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
});