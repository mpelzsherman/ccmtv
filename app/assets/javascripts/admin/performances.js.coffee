# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
   $('#performance_composition_tokens').tokenInput '/admin/compositions.json'
    theme: 'facebook'
    prePopulate:$('#performance_composition_tokens').data('load')
    propertyToSearch: 'full_title'
    tokenLimit: 1

$(document).ready ->
  $("#performance_url_attributes_http").change ->
    template = "<iframe width='420' height='315' src='__URL__' frameborder='0' allowfullscreen></iframe>"
    url = $(this).val().replace /watch\?v=/, 'embed/'
    iframe = template.replace /__URL__/g, url
    $("#video.well").html('')
    $("#video.well").append(iframe)
    $("#performance_url_attributes_embeded_code").val(iframe)
