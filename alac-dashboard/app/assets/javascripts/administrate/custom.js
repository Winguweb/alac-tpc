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

});