$(document).ready(function(){
  const characterizationAuthority = $("input[type=radio][name='characterization[known_authority]']:checked").val()

  if (characterizationAuthority == "true") {
    $('.select-known-authority').removeClass('d-none');
  }

  const characterizationHasTool = $("input[type=radio][name='characterization[has_tool]']:checked").val()

  if (characterizationHasTool === 'true') {
    $('.has-tool-select').removeClass('d-none');
  }
});