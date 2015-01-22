Template.editButton.events
  'click .edit.button': ->
    $('.set, .cvHeader').toggleClass('editable')
    $('.editMode, .editInfo').toggle (=>
      $(@).show()), =>
      $(@).hide()
      
    $('.long.edit.modal')
      .modal(
        onDeny: ->
          console.log 'canceled'
          return false
        ,
        onApprove : ->
          console.log 'pressed ok'
      )
      .modal('show')
