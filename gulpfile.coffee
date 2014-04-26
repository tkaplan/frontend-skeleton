paths = require 'path'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
watch = require 'gulp-watch'
filter = require 'gulp-filter'
tap = require 'gulp-tap'
jade = require 'gulp-jade'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
debug = require 'gulp-debug'
argv = require('yargs').argv
watchr = require 'watchr'
ignore = require 'gulp-ignore'
grep = require 'gulp-grep-stream'

src_files =
  modules_less: [
    'modules/**/views/assets/stylesheets/*.less'
    'modules/**'
  ]
  filter_less: filter [
    'modules/**/views/assets/stylesheets/*.less'
  ]
  modules_coffee: [
    'modules/**'
    'modules/**/configs/*.coffee'
    'modules/**/controllers/*.coffee'
    'modules/**/directives/*.coffee'
    'modules/**/services/*.coffee'
    'modules/**/app.coffee'
  ]
  modules_jade: [
    'modules/**/views/*.jade'
    'modules/**'
  ]
  filter_jade: filter [
    'modules/**/views/*.jade'
  ]
  modules_html: [
    'modules/**/views/*.html'
    'modules/**'
  ]
  filter_html: filter [
    'modules/**/views/*.html'
  ]
gulp.task 'watch', () ->

  # gulp.src src_files.modules_html
  #   .pipe watch {
  #     name: 'html'
  #     emit: 'one'
  #     emmitOnGlob: false
  #     glob: src_files.modules_html
  #     }, (files) ->
  #       files.pipe src_files.filter_html
  #            .pipe gulp.dest('./dist')

  # gulp.src src_files.modules_jade
  #   .pipe watch {
  #     name: 'jade'
  #     emit: 'one'
  #     emmitOnGlob: false
  #     glob: src_files.modules_jade
  #     }, (files) ->
  #       files.pipe src_files.filter_jade
  #            .pipe jade()
  #            .pipe gulp.dest('./dist')

  gulp.src src_files.modules_jade
    .pipe watch {
      emit: 'one'
      glob: src_files.modules_jade
      emitOnGlob: false
    }, (files) ->
      files.pipe plumber()
      .pipe ignore.include('**/*.jade')
      .pipe jade()
      .pipe gulp.dest('./dist')
    .on('error', (error) ->
      # There is a bug in gulp-watch when deleting watched files
      # Do nothing until they fix the bug.
      return
    )
  
  gulp.src src_files.modules_coffee
    .pipe watch {
      emit: 'all'
      glob: src_files.modules_coffee
      emitOnGlob: false
    }, (files) ->
      files.pipe plumber()
      .pipe ignore.include('**/*.coffee')
      .pipe coffee()
      .pipe concat('all.js')
      .pipe gulp.dest('./dist')
    .on('error', (error) ->
      # There is a bug in gulp-watch when deleting watched files
      # Do nothing until they fix the bug.
      return
    )

  # gulp.src src_files.modules_less
  #   .pipe watch {
  #     name: 'less'
  #     emit: 'all'
  #     emmitOnGlob: false
  #     glob: src_files.modules_less
  #     }, (files) ->
  #       files.pipe src_files.filter_less
  #            .pipe less()
  #            .pipe concat('all.css')
  #            .pipe gulp.dest('./dist')

  return
