Accounts.ui.config
  #requestPermissions:
  #  github:["user","public_repo"]
  passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"

#Config for accounts
###
if Meteor.isServer
  Accounts.config
    #Uncomment to forbid account creation
    forbidClientAccountCreation: true
###
