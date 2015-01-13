Template.hideRemoveBtn.events
  'click .btn.btn-hide': (e) ->
    e.preventDefault()
    console.log 'hide button hit'
    $(e.target).parent().prev().toggle('fade')
    if $(@).text() is 'Hide'
      $(e.target).text('Show')
    else
      $(e.target).text('Hide')

  #delete button
  'click .btn.btn-remove': (e) ->
    e.preventDefault()
    # confirm - modal dialog, use bootbox: mizzao:bootboxjs
    docId = @_id
    collectionName = 'CV'

    if confirm 'Are you sure?'
      Meteor.call 'removeDoc', collectionName, docId
      console.log 'remove successful'
      console.log docId
    else
      console.log 'not removed'
