# Send the input data to the mongo collection experience
Template.input.events
  "submit .new": (e) -> #refactor?
    collectionName = 'CV'

    title = e.target.title.value
    start = e.target.start.value
    end = e.target.end.value
    where = e.target.where.value
    desc = e.target.desc.value
    category = e.target.category.value

    # Insert the input text to the db
    Meteor.call "addInput", collectionName, title, start, end, where, desc, category

    # Clear the form
    e.target.input.value('')

    # Prevent default form submit
    false
    console.log 'insert successful'