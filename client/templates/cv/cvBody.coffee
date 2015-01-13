##cv body
#further refactoring needed?
Meteor.subscribe 'cv'

collectionName = 'CV'

Template.cvBody.helpers
  experience: ->
    CV.find {category:'experience'},
    # find the data belonging to the category experiences
    # show the newest experience first
    # 1 is ascending; -1 is descending
      sort:
        start: -1

  education: ->
    CV.find {category:'education'},
      sort:
        start: -1

  languages: ->
    CV.find {category:'languages'},
      sort:
        start: -1

  skills: ->
    CV.find {category:'skills'},
      sort:
        start: -1

  awards: ->
    CV.find {category:'awards'},
      sort:
        start: -1


Template.cvBody.events
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
        reutur
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
