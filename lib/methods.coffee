##########################
##### Methods starts #####
##########################
Meteor.methods

  # For adding inputs from experiences, and education
  addCVtitle: (collecitonName, CVTitle) ->
    global[collectionName].insert
      CVTitle: CVTitle
      createdAt: new Date()
      owner: Meteor.userId()
      username: Meteor.user().username

  addInput: (addInputCollectionName,title,start,end,where,desc,category) ->
  #throw new Meteor.Error("not-authorized") unless Meteor.userId()
  #Using global[var] makes it possible to define the name of collection dynamically!
  #found it here http://stackoverflow.com/questions/26661498/mongo-insert-inside-of-a-meteor-method
    global[addInputCollectionName].insert
      title: title
      start: start
      end: end
      where: where
      desc: desc
      category: category
      createdAt: new Date() #current time
      owner: Meteor.userId() # _id of logged in user
      username: Meteor.user().username # username of logged in user

# This method updates the contents of the field the current user is editing. The matching field name is dynamically retrieved.
  updateEditable: (updateCollectionName, docId, fieldName, editedValue) ->
    f = String(fieldName)
    e = String(editedValue)
    set = {}
    set[f] = e

    global[updateCollectionName].update docId,
      $set: set,
       true

# Remove data from database
  removeDoc: (removeCollectionName, docId) ->
    global[removeCollectionName].remove docId

  ########################
  ##### Methods ends #####
  ########################

if Meteor.isServer
  Meteor.methods
    pdf: (site, output) ->
      wk = Meteor.npmRequire 'wkhtmltopdf'
      wk site
        .pipe fs.createWriteStream output
