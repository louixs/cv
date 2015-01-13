# This function checks if the document the current user is trying to manipulate is the owner
# Accepts two arguments:
# 1. CollectionName – Name of the collection that is defined in collection.coffee - use the variable name e.g Experiences
# 2. id is usually @_id i.e. the id of the document that is selected

@checkDocOwner = (collectionName, id) ->
  doc = collectionName.findOne(id)
  owner = doc.owner
  unless owner is Meteor.userId()
    throw new Meteor.error "You are not permitted to edit"
