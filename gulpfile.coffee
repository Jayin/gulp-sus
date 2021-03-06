gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'compile', ->
	gulp.src('src/**/*.coffee')
		.pipe coffee()
		.pipe gulp.dest('lib')

gulp.task 'example', ->
	sus = require './lib/index'
	gulp.src('example/src/style.css')
		.pipe sus
			split: true
		.pipe gulp.dest('example/dest')
	gulp.src('example/src/style.css')
		.pipe sus
			baseSurfix: false
		.pipe gulp.dest('example/dest')
	gulp.src('example/src/style.css')
		.pipe sus
			split: true
			baseSurfix: '_base'
			spritesSurfix: '_sprites'
		.pipe gulp.dest('example/dest')

gulp.task 'default', ['compile']