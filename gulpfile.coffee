paths = require 'path'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
watch = require 'gulp-watch'
tap = require 'gulp-tap'
jade = require 'gulp-jade'
concat = require 'gulp-concat'

src_files =
  modules_less: 'modules/**/views/assets/stylesheets/*.less'
  modules_coffee: [
    'modules/**/configs/*.coffee',
    'modules/**/controllers/*.coffee',
    'modules/**/directives/*.coffee',
    'modules/**/services/*.coffee',
    'modules/**/app.coffee'
  ]
  modules_jade: [
    'modules/**/views/*.jade'
  ]

gulp.task 'less', () ->
  gulp.src src_files.modules_less
    .pipe watch {
      name: 'less'
      emit: 'all'
      glob: src_files.modules_less
      }, (files) ->
        files.pipe less()
             .pipe concat('all.css')
             .pipe gulp.dest('./dist')

gulp.task 'coffee', () ->
  gulp.src src_files.modules_coffee
    .pipe watch {
      name: 'coffee'
      emit: 'all'
      glob: src_files.modules_coffee
      }, (files) ->
        files.pipe coffee()
             .pipe concat('all.js')
             .pipe gulp.dest('./dist')

gulp.task 'jade', () ->
  gulp.src src_files.modules_jade
    .pipe watch {
      name: 'jade'
      emit: 'one'
      glob: src_files.modules_jade
      }, (files) ->
        files.pipe jade()
             .pipe gulp.dest('./dist')

gulp.task 'watch-all', () ->
  gulp.src src_files.modules_jade
    .pipe watch {
      name: 'jade'
      emit: 'one'
      glob: src_files.modules_jade
      }, (files) ->
        files.pipe jade()
             .pipe gulp.dest('./dist')

  gulp.src src_files.modules_coffee
    .pipe watch {
      name: 'coffee'
      emit: 'all'
      glob: src_files.modules_coffee
      }, (files) ->
        files.pipe coffee()
             .pipe concat('all.js')
             .pipe gulp.dest('./dist')

  gulp.src src_files.modules_less
    .pipe watch {
      name: 'less'
      emit: 'all'
      glob: src_files.modules_less
      }, (files) ->
        files.pipe less()
             .pipe concat('all.css')
             .pipe gulp.dest('./dist')