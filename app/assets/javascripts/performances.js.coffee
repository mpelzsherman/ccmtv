# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".chzn-select").chosen()
  $("#create_performer_link").on 'click', ->
    $("#performer_fields").append("<label for='performance_performer_attributes_Name'>Performer Name</label>")
    $("#performer_fields").append("<input id='performance_performer_attributes_canonical_name' name='performance[performer_attributes][canonical_name]' size='30' type='text'>")
    $("#performer_fields").append("<input name='performance[performer_attributes][person_type]' type='hidden' value='performer'>")
    $("#performer_fields").append("<a id='remove_performer' href='javascript:void(0'>Cancel</a>")
    $("#create_performer").hide()
    $("#remove_performer").on 'click', ->
      $("#performer_fields").empty()
      $("#create_performer").show()

  $("#create_composition_link").on 'click', ->
    $.get('/admin/new_composition_ajax', (data) ->
      $('#composition_fields').append(data)
      $("#composition_fields").append("<a id='remove_composition' href='javascript:void(0'>Cancel</a>")
      $("#create_composition").hide()
      $("#remove_composition").on 'click', ->
        $("#composition_fields").empty()
        $("#create_composition").show())
