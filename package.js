Package.describe({
  name: 'sunstory:meteor-template-helpers',
  summary: 'Useful template helpers.',
  version: '1.0.2',
  git: 'https://github.com/sunstorymvp/meteor-template-helpers.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.3');
  api.use([
    'coffeescript',
    'underscore',
    'check',
    'session'
  ]);
  api.addFiles('meteor-template-helpers.coffee', 'client');
});
