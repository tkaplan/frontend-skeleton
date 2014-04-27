paths = require 'path'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
watch = require 'gulp-watch'
jade = require 'gulp-jade'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
ignore = require 'gulp-ignore'
argv = require('yargs').argv

src_files =
  modules_less: [
    'assets/stylesheets/*.less'
    'modules/**/views/assets/stylesheets/*.less'
    'modules/**'
  ]
  modules_coffee: [
    'coffee/*.coffee'
    'modules/**'
    'modules/**/configs/*.coffee'
    'modules/**/controllers/*.coffee'
    'modules/**/directives/*.coffee'
    'modules/**/services/*.coffee'
    'modules/**/app.coffee'
  ]
  modules_jade: [
    '*.jade'
    'modules/**/views/*.jade'
    'modules/**'
  ]
  modules_html: [
    'modules/**/views/*.html'
    'modules/**'
  ]

gulp.task 'watch', () ->

  gulp.src src_files.modules_html
    .pipe watch {
      emit: 'one'
      glob: src_files.modules_html
      emitOnGlob: false
    }, (files) ->
      files.pipe plumber()
      .pipe ignore.include('**/*.html')
      .pipe gulp.dest('./dist')
    .on('error', (error) ->
      # There is a bug in gulp-watch when deleting watched files
      # Do nothing until they fix the bug.
      return
    )

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

  gulp.src src_files.modules_less
    .pipe watch {
      emit: 'all'
      glob: src_files.modules_less
      emitOnGlob: false
    }, (files) ->
      files.pipe plumber()
      .pipe ignore.include('**/*.less')
      .pipe less()
      .pipe concat('all.css')
      .pipe gulp.dest('./dist')
    .on('error', (error) ->
      # There is a bug in gulp-watch when deleting watched files
      # Do nothing until they fix the bug.
      return
    )

  return
