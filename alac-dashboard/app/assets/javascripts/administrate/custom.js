$(document).ready(function(){
  // Actors form
  const val = $("input[type=radio][name='actor[general_type]']:checked").val()
  
  if (val === 'individual') {
    $('.actor-charge-field').removeClass('d-none');
    $('.actors-collective-select').addClass('d-none');
    $('.actors-individual-select').removeClass('d-none');
  } else {
    $('.actor-charge-field').addClass('d-none');
    $('.actors-individual-select').addClass('d-none');
    $('.actors-collective-select').removeClass('d-none');
  }

  // Show charge field when individual actor type is selected
  $('.actors-type-checkbox').click(function(){
    var inputValue = $(this).attr('value');
    if (inputValue === 'individual') {
      $('.actor-charge-field').removeClass('d-none');
      $('.actors-collective-select').addClass('d-none');
      $('.actors-individual-select').removeClass('d-none');
    } else {
      $('.actor-charge-field').addClass('d-none');
      $('.actors-individual-select').addClass('d-none');
      $('.actors-collective-select').removeClass('d-none');
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
    
  });

  // Characterizations form
  // Show select when known authority is selected
  $("input[type=radio][name='characterization[known_authority]']").click(function() {
    if (this.value === 'true') {
      $('.select-known-authority').removeClass('d-none');
    } else {
      $('.select-known-authority').addClass('d-none');
    }
  })


  $('#ui-authority').on('change', function() {
    const value = this.value;
    if (value === 'Otro') {
      $('.known-authority-input').removeClass('d-none');
    } else {
      $('.known-authority-input').addClass('d-none');
    };
  });

  // Add custom option to authority
  $('.authority-text-input').on('change', function() {
    var inputValue = this.value;
    $('#characterization_authority').val(inputValue);
  });

    // Show select when has_tool is selected
    $("input[type=radio][name='characterization[has_tool]']").click(function() {
      if (this.value === 'true') {
        $('.has-tool-select').removeClass('d-none');
      } else {
        $('.has-tool-select').addClass('d-none');
      }
    })
  
    $('#ui-tool').on('change', function() {
      const value = this.value;
      if (value === 'Otros') {
        $('.has-tool-input').removeClass('d-none');
      } else {
        $('.has-tool-input').addClass('d-none');
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
      $("#tool_table > tbody").empty();
      var id = $(e.relatedTarget).data('id');
      $('#tool_advisory_id').val(id);
      var tools = $(e.relatedTarget).data('tools');
      
      $(tools).each(function(index, value) {
        
        var content = '<tr><th scope="row">' + (index + 1) + '</th><td><a href="'+value.document.url+'" target="_blank">'+value.tools_used+'<a/></td><td>'+value.entity+'</td><td>'+value.radication_date+'</td><td>'+value.deadline+'</td><td>'+value.have_answer+'</td><td>'+value.answer_date+'</td><td><div class="btn-group" role="group" aria-label="Tools buttons"><a href="/admin/tools/'+ value.id + '/edit" class="action-show btn btn-link">Editar</a><a class="action-edit btn btn-link" data-confirm="¿Estás seguro?" rel="nofollow" data-method="delete" href="/admin/tools/' + value.id +'">Eliminar</a><a href="/admin/tools/'+ value.id + '" class="action-show btn btn-link">Ver</a></div></td></tr>'
        $('#tool_table > tbody').append(content);
      });
     });


     $('.crime-select').on('change', function(){
       let options = $('.crime-select select').val()
       let stringify_options = JSON.stringify(options);
        
       $('#evolution_crime').val(stringify_options)
     })
     
    $('.tool-text-input').on('change', function() {
      var inputValue = this.value;
      var selected = $('#characterization_tool').val(inputValue);
    });

    $('.multiple-select').on('change', function(){

      let options = $(this).val();
      let id = $(this).data('id')
      let stringify_options = JSON.stringify(options);
      $('#'+id).val(stringify_options)
    });
    $('.form-btn-submit').on('click', function(){
      $('.hide').remove()
      $('.d-none').remove()
    })
    $('.form-submit').on('submit', function(){
      setTimeout(function(){
        location.reload()
      }, 500)
    })
});
