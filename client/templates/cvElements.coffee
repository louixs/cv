###function for getting field names
class window.submitValues
  constructor: (@name...) ->

  getfieldNames: (@name...) ->
    fieldNames=[@name...]
    t = e.target

    for name in fieldNames
      name = t.name.value

submitExperience = new submitValues
console.log submitExperience 'title', 'start', 'end', 'where', 'desc'
###
