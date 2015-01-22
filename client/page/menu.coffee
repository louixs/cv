if Meteor.isClient
  Template.menu.helpers
    activeIfTemplateIs: (template) ->
      currentRoute = Router.current()
      currentTemplate = currentRoute.lookupTemplate()
      (if currentRoute and template is currentTemplate then "active" else "")

    currentPath: (path) ->
      currentRoute = Router.current()
      if currentRoute = path then true
