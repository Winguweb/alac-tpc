$(document).ready(function(){
  $('.actors-type-checkbox').click(function(){
    var inputValue = $(this).attr('value');
    if (inputValue === 'individual') {
      $('.actor-charge-field').removeClass('d-none');
    } else {
      $('.actor-charge-field').addClass('d-none');
    };
  });
});