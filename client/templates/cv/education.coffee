Meteor.subscribe 'education'
# Send the input data to the mongo collection education
collectionName = 'Education'

Template.education.helpers
  education: ->
    Education.find {},
    # find the database: experiences
    # show the newest experience first
    # 1 is ascending; -1 is descending
      sort:
        end: -1

Template.educationInput.events
  "submit .new-education": (e) ->
    # Get the text from the title form
    title = e.target.title.value
    start = e.target.start.value
    end = e.target.start.value
    where = e.target.where.value
    desc = e.target.desc.value

    Meteor.call "addInput", 'Education', title, start, end, where, desc

  # Clear the form
    e.target.educationInput.value('')

  # Prevent default form submit
    false

Template.education.events
  #hide button - hide the each row section when clicked
  'click .btn.btn-hide': (e) ->
    e.preventDefault()
    console.log 'hide button hit'
    $(e.target).parent().prev().toggle('fade')
    if $(@).text() is 'Hide'
      $(e.target).text('Show')
    else
      $(e.target).text('Hide')

  #delete button
  'click .btn.btn-remove': (e) ->
    e.preventDefault()
    # confirm - modal dialog, use bootbox: mizzao:bootboxjs
    docId = @_id
    console.log 'on app coffee '+docId
    #calling the function that checks if the current user is owner of the document
    checkDocOwner(Education, docId)
    if confirm 'Are you sure?'
      Meteor.call 'removeDoc', collectionName, docId
      console.log 'remove successful'
    else
      console.log 'not removed'

  #double click to edit the .editable content
  'dblclick .editable': (e) ->
    e.preventDefault()
    Session.set('editing', @_id)
    thisDoc = $(e.target)
    #Document owner checking function

    owner = @owner
    console.log owner
    currentUser = Meteor.userId()
    if owner isnt currentUser
      throw new Meteor.Error "You are not permitted to edit"
    else
      console.log ('editing')
      if thisDoc.hasClass('edited')
        thisDoc.removeClass('edited')
      #set the class editing
      thisDoc.addClass('editing')
      thisDoc.attr('contenteditable', true)

#This keydown event fires as soon as I hit the keys I specify e.g. enter, escape. Currently this is used for saving the content I edit by dubble clicking
  'keydown .editing': (e) ->
    typed = e.which
    thisObj = $(e.target)
    shift = 16
    ctr = 17
    enter = 13
    esc = 27
    docId = Session.get('editing')

    if typed is enter or typed is esc
      #Saving part
      console.log('updating the text you are editing for '+docId)
      #editingId = Session.get('editing')
      #Set the id of the edited one to match the field to update
      fieldName = thisObj.parent(1).attr('class')
      #retrieve the class of the editing section which corresponds to the fieldname.
      editedValue = thisObj.text()
      #update
      #Calling meteor method to update a field in document in a collection

      Meteor.call 'updateEditable',
        collectionName,
        docId,
        fieldName,
        editedValue,
        (error, id) ->
          if error
            console.log error.reason
          else
            console.log 'update successful'
            console.log ('updated the document '+docId+' with the field name '+fieldName+' and '+' content '+editedValue+' into the collection '+collectionName)

      thisObj.removeClass('editing')
      thisObj.attr('contenteditable', false)
      thisObj.addClass('edited')

      e.preventDefault()
    else
