Meteor.startup ->
  Template.registerHelper 'settings', (property) ->
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

    prop = Template.instance()[property]

    unless prop then return

    if _.isFunction prop.get
      if key then prop.get key
      else prop.get()
    else if _.isFunction prop then prop()
    else prop

  Template.registerHelper 'session', (property) ->
    Session.get property

  Template.registerHelper 'imageLoaded', (imageUrl) ->
    template = Template.instance()

    if template._imageLoaded
      template._imageLoaded.get()
    else
      template._imageLoaded = new Blaze.ReactiveVar false

      image = $('<img/>')

      image.on 'load', ->
        image.remove()
        template._imageLoaded.set true

      image.attr 'src', imageUrl

      template._imageLoaded.get()

  Template.registerHelper 'imageLoading', (imageUrl) ->
    template = Template.instance()

    if template._imageLoading
      template._imageLoading.get()
    else
      template._imageLoading = new Blaze.ReactiveVar true

      image = $('<img/>')

      image.on 'load', ->
        image.remove()
        template._imageLoading.set false

      image.attr 'src', imageUrl

      template._imageLoading.get()
