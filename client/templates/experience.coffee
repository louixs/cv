#############################
##### Experience starts #####
#############################
Meteor.subscribe 'experiences'

collectionName = 'Experiences'
###
Template.experience.helpers
  isOwner: ->
    @owner is Meteor.userId()
###
Template.experience.helpers
  experiences: ->
    Experiences.find {},
    # find the database: experiences
    # show the newest experience first
    # 1 is ascending; -1 is descending
      sort:
        start: -1

# Send the input data to the mongo collection experience
Template.experienceInput.events
  "submit .new": (e) ->
    # Get the text from the title form
    #calling the method from class submitValues

    #refactor?
    title = e.target.title.value
    start = e.target.start.value
    end = e.target.end.value
    where = e.target.where.value
    desc = e.target.desc.value

    # Insert the input text to the db
    Meteor.call "addInput", 'Experiences', title, start, end, where, desc

  # Clear the form
    e.target.experienceInput.value('')

  # Prevent default form submit
    false

### Editable text on click ###
# Saving the edit: doubleclick, click enter or esc key
# event.which shorthand and key variables

Template.experience.events
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
    #calling the function that checks if the current
    #user is owner of the document
    checkDocOwner(Experiences, docId)
    if confirm 'Are you sure?'
      Meteor.call 'removeDoc', collectionName, docId
      console.log 'remove successful'
    else
      console.log 'not removed',

    #double click to edit the .editable content
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

  ###
  This keydown event fires as soon as I hit the keys
  I specify e.g. enter, escape.
  Currently this is used for saving the content I edit by dubble clicking
  ###

  'keydown .editing': (e) ->
    typed = e.which
    thisObj = $(e.target)
    shift = e.shiftKey
    ctr = 17
    enter = 13
    esc = 27
    docId = Session.get('editing')
    #Set the id of the edited one to match the field to update
    fieldName = thisObj.parent(1).attr('class')

    editedValue = thisObj.text()

    switch typed
      when shift and enter
        ###
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

        thisObj.removeClass('editing')
        thisObj.attr('contenteditable', false)
        thisObj.addClass('edited')
        e.preventDefault()
        ###
      when enter or esc
        e.preventDefault()
        console.log('updating the text you are editing for '+docId)

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
              console.log ('update successful')

        thisObj.removeClass('editing')
        thisObj.attr('contenteditable', false)
        thisObj.addClass('edited')

      else
