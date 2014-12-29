class ClickEditable
  'click .editable': (e) ->
    e.preventDefault()
    thisDoc = $(e.target)
    #Document owner checking function
    owner = @owner
    console.log owner
    currentUser = Meteor.userId()
    Session.set('editing', @_id)

    if owner isnt currentUser
      throw new Meteor.Error "You are not permitted to edit"
    else
      console.log ('editing')
      if thisDoc.hasClass('edited')
        thisDoc.removeClass('edited')
      #set the class editing
      thisDoc.addClass('editing')
      thisDoc.attr('contenteditable', true)
