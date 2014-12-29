###configuration for yogiben:admin package
@AdminConfig =
  adminEmails: 'ryuei.sasaki@gmail.com'
  collections:
    experiences: {}
###
## Make the firs user admin fix
## provided by
#######
#https://github.com/yogiben/meteor-admin/issues/20#
################
#Run only after you have created a user.
#Then comment it out
###
Meteor.startup ->
  if Meteor.isServer
    user = Meteor.users.findOne()
    Meteor.users.upsert(
      {_id: user._id},
      {
        $set: {
          roles: ['admin']
        }
      }
    )
    console.log("make 1st user admin", user.roles)
###
