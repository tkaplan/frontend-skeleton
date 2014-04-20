var paths = require('path');
var gulp = require('gulp');
var less = require('less');

var changed = require('gulp-less');

gulp.task('default', function() {
	gulp.src('modules/**/views/assets/stylesheets/*.less')
		.pipe(less())
		.pipe(concat('all.min.css'))
		.pipe(gulp.dest('./dist/asdf.css'))
});