#############################
##### Body              #####
#############################

###
Template.editMode.events
  'click .btn-pdf': (e) ->
    Meteor.call 'pdf', 'google.com', 'output.pdf'

Template.body.users = ->
  Meteor.users.find()
###
