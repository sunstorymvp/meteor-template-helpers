Meteor.startup ->
  Template.registerHelper 'settings', (property) ->
    check property, Match.Optional String

    if property
      Meteor.settings.public[property]
    else
      Meteor.settings.public

  Template.registerHelper 'Template', ->
    # remove Spacebars.kw object from arguments
    args = [].slice.call arguments, 0, -1

    unless args.length then return

    property = args[0]
    key = args[1]

    check property, String
    check key, Match.Optional String

    prop = Template.instance()[property]

    unless prop then return

    if _.isFunction prop.get
      if key then prop.get key
      else prop.get()
    else if _.isFunction prop then prop()
    else prop

  Template.registerHelper 'session', ->
    check property, String

    Session.get property
