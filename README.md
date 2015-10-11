# meteor-template-helpers
Useful template helpers.

Included helpers:

* `Template` - access to current `Template.instance()`
* `settings` - access to `Meteor.settings.public`
* `session` - access to `Session`

### Install

`meteor add sunstory:meteor-template-helpers`

### Use

`Template`:

```coffeescript
  Template.example.onCreated ->
    @instanceVariable = 'one'
    @reactiveVariable = new Blaze.ReactiveVar
    @reactiveDict = new ReactiveDict
    @instanceObject = 
      first: 'Mercury'
      second: 'Venus'

    Meteor.call 'someMethod', =>
      @reactiveVariable.set 'two'
      @reactiveDict.set 
        foo: 'three'
        bar: 'four'
```
```handlebars
  <template name="example">
    <p>instanceVariable is {{Template 'instanceVariable'}}</p>
    <p>reactiveVariable is {{Template 'reactiveVariable'}}</p>
    <p>reactiveDict foo is {{Template 'reactiveDict' 'foo'}}</p>
    <p>reactiveDict bar is {{Template 'reactiveDict' 'bar'}}</p>

    {{#with Template 'instanceObject'}}
      <p>{{first}}</p>
      <p>{{second}}</p>
    {{/with}}
  </template>
```

`settings`:

```json
  {
    "public": {
      "twitterName": "elonmusk",
      "twitterUrl": "https://twitter.com/elonmusk"
    }
  }
```
```handlebars
  <p>nickname is {{settings 'twitterName'}}</p>
  <p>nickname is {{settings 'twitterUrl'}}</p>
```

```json
  {
    "public": {
      "twitter": {
        "name": "elonmusk",
        "url": "https://twitter.com/elonmusk"
      }
    }
  }
```
```handlebars
  {{#with settings}}
    <p>nickname is {{twitter.name}}</p>
    <p>url is {{twitter.url}}</p>
  {{/with}}
```

`session`:

```javascript
  Session.set('planet', 'Earth')
```
```handlebars
  <p>planet is {{session 'planet'}}</p>
```

```javascript
  Session.set('planets', { first: 'Mercury', second: 'Venus' })
```
```handlebars
  {{#with session 'planets'}}
    <p>first is {{first}}</p>
    <p>second is {{second}}</p>
  {{/with}}
```
