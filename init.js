// Generated by CoffeeScript 1.7.1
(function() {
  var fs;

  fs = require('fs');

  fs.mkdir('coffee', '0777', function(err) {});

  fs.mkdir('partials', '0777', function(err) {});

  fs.mkdir('modules', '0777', function(err) {});

  fs.mkdir('dist', '0777', function(err) {});

  fs.mkdir('assets', '0777', function(err) {
    fs.mkdir('assets/stylesheets', '0777', function(err) {});
    return fs.mkdir('assets/media', '0777', function(err) {});
  });

}).call(this);
