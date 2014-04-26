// Generated by CoffeeScript 1.7.1
(function() {
  var argv, coffee, concat, debug, filter, grep, gulp, ignore, jade, less, paths, plumber, src_files, tap, watch, watchr;

  paths = require('path');

  gulp = require('gulp');

  coffee = require('gulp-coffee');

  less = require('gulp-less');

  watch = require('gulp-watch');

  filter = require('gulp-filter');

  tap = require('gulp-tap');

  jade = require('gulp-jade');

  concat = require('gulp-concat');

  plumber = require('gulp-plumber');

  debug = require('gulp-debug');

  argv = require('yargs').argv;

  watchr = require('watchr');

  ignore = require('gulp-ignore');

  grep = require('gulp-grep-stream');

  src_files = {
    modules_less: ['modules/**/views/assets/stylesheets/*.less', 'modules/**'],
    filter_less: filter(['modules/**/views/assets/stylesheets/*.less']),
    modules_coffee: ['modules/**', 'modules/**/configs/*.coffee', 'modules/**/controllers/*.coffee', 'modules/**/directives/*.coffee', 'modules/**/services/*.coffee', 'modules/**/app.coffee'],
    modules_jade: ['modules/**/views/*.jade', 'modules/**'],
    filter_jade: filter(['modules/**/views/*.jade']),
    modules_html: ['modules/**/views/*.html', 'modules/**'],
    filter_html: filter(['modules/**/views/*.html'])
  };

  gulp.task('watch', function() {
    gulp.src(src_files.modules_jade).pipe(watch({
      emit: 'one',
      glob: src_files.modules_jade,
      emitOnGlob: false
    }, function(files) {
      return files.pipe(plumber()).pipe(ignore.include('**/*.jade')).pipe(jade()).pipe(gulp.dest('./dist'));
    })).on('error', function(error) {});
    gulp.src(src_files.modules_coffee).pipe(watch({
      emit: 'all',
      glob: src_files.modules_coffee,
      emitOnGlob: false
    }, function(files) {
      return files.pipe(plumber()).pipe(ignore.include('**/*.coffee')).pipe(coffee()).pipe(concat('all.js')).pipe(gulp.dest('./dist'));
    })).on('error', function(error) {});
  });

}).call(this);
