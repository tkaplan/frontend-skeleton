fs = require 'fs'
argv = require('yargs').argv

if argv.module and argv.module is ''
  console.log 'Please enter a name for your new module'
else if argv.module
  fs.mkdir 'modules', '0777', (err) ->
    base_uri = "modules/#{argv.module}"
    fs.mkdir base_uri, '0777', (err) ->
      if err? and err.code is 'EEXIST'
        console.log 'The following module already exist!'
      else
        fs.mkdir "#{base_uri}/configs", '0777', (err) ->
        fs.mkdir "#{base_uri}/controllers", '0777', (err) ->
        fs.mkdir "#{base_uri}/directives", '0777', (err) ->
        fs.mkdir "#{base_uri}/services", '0777', (err) ->
        fs.mkdir "#{base_uri}/tests", '0777', (err) ->
          fs.mkdir "#{base_uri}/tests/configs", '0777', (err) ->
          fs.mkdir "#{base_uri}/tests/controllers", '0777', (err) ->
          fs.mkdir "#{base_uri}/tests/directives", '0777', (err) ->
          fs.mkdir "#{base_uri}/tests/services", '0777', (err) ->
          fs.mkdir "#{base_uri}/tests/e2e", '0777', (err) ->
          # make karma.conf.coffee file
        fs.mkdir "#{base_uri}/views", '0777', (err) ->
          fs.mkdir "#{base_uri}/views/assets", '0777', (err) ->
            fs.mkdir "#{base_uri}/views/assets/media", '0777', (err) ->
            fs.mkdir "#{base_uri}/views/assets/stylesheets", '0777', (err) ->
        # create app.coffee
        fs.open "#{base_uri}/app.coffee", 'w', '0777', (err, fd) ->
          fs.write fd, "app = angular.module \'#{argv.module}\', []"

if argv.partial and argv.partial is ''
  console.log 'Please enter a name for your new jade partial'
else if argv.partial
  fs.mkdir 'partials', '0777', (err) ->
    fs.open "partials/#{argv.partial}.jade", 'w', '0777', (err, fd) ->
          fs.write fd, '''
            // You should include this partial into your layout
          '''