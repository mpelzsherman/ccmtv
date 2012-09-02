jQuery ->
  $('#person_composer').click ->
    if this.checked
      $("#person_performer").attr('checked', false)
    else
      $("#person_performer").attr('checked', true)
    return true

  $('#person_performer').click ->
    if this.checked
      $("#person_composer").attr('checked', false)
    else
      $("#person_composer").attr('checked', true)
    return true
