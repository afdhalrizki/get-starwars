gulp = require('gulp')
uglify = require('gulp-uglify')

# Scripts Task
# Uglifies
gulp.task 'scripts', ->
	gulp.src('src/js/*.js')
		.pipe(uglify())
		.pipe(gulp.dest('../temp/js'))

# Styles Task
gulp.task 'styles', ->
	console.log "styles start"

# Templates Task
gulp.task 'templates', ->
	console.log 'templates'

# Watch Task
gulp.task 'watch', ->
	gulp.watch('src/js/*.js', ['scripts'])

gulp.task('default', ['scripts', 'styles', 'templates', 'watch'])
