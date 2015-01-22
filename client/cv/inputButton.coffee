Template.inputButton.events
  'click .input.button': ->
    $('.ui.long.input.modal')
      .modal(
        onDeny: ->
          console.log 'canceled'
          return false
        ,
        onApprove : ->
          console.log 'pressed ok'
      )
      .modal('show')
