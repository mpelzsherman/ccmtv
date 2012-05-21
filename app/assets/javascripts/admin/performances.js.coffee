# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
   $('#performance_composition_tokens').tokenInput '/admin/compositions.json'
    theme: 'facebook'
    prePopulate:$('#performance_composition_tokens').data('load')
    propertyToSearch: 'full_title'