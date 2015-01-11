#############################
##### Server-side start #####
#############################
Meteor.publish 'cv', ->
  CV.find()

    # {owner:@userId }
    # Including this code above will publish only to the onwer of the documents
    # If user is not logged in, the contents are hidden

CV.allow
  insert: (userId, doc) ->

    # the user must be logged in, and the document must be owned by the user
    userId and doc.owner is userId

  update: (userId, doc, fields, modifier) ->

    # can only change your own documents
    doc.owner is userId

  remove: (userId, doc, fields, modified) ->

    # can only remove your own documents
    doc.owner is userId

  fetch: ["owner"]

Meteor.publish 'experiences', ->
  Experiences.find()

    # {owner:@userId }
    # Including this code above will publish only to the onwer of the documents
    # If user is not logged in, the contents are hidden

Experiences.allow
  insert: (userId, doc) ->

    # the user must be logged in, and the document must be owned by the user
    userId and doc.owner is userId

  update: (userId, doc, fields, modifier) ->

    # can only change your own documents
    doc.owner is userId

  remove: (userId, doc, fields, modified) ->

    # can only remove your own documents
    doc.owner is userId

  fetch: ["owner"]

Meteor.publish 'education', ->
  Education.find()

Education.allow
  insert: (userId, doc) ->

    # the user must be logged in, and the document must be owned by the user
    userId and doc.owner is userId

  update: (userId, doc, fields, modifier) ->

    # can only change your own documents
    doc.owner is userId

  remove: (userId, doc, fields, modified) ->

    # can only remove your own documents
    doc.owner is userId

  fetch: ["owner"]
###########################
##### Server-side end #####
###########################
