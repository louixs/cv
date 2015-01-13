# For toggling edit mode elements:
# Edit/remove buttons, input fields
Template.buttons.events
  'click .button.edit': (e) ->
    #$(e.target).text (i, text) ->
    #  (if text is 'Edit' then 'Editing...' else 'Edit')
    $('.set, .cvHeader').toggleClass('editable')
    $('.editMode, .editInfo').toggle (=>
      $(@).show()), =>
      $(@).hide()

  'click .button.pdf': (e) ->
    
