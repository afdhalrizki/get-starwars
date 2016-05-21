gulp        = require "gulp"
uglify      = require "gulp-uglify"
sass        = require "gulp-sass"
jade        = require "gulp-jade"
coffee      = require "gulp-coffee"
plumber     = require "gulp-plumber"
browserSync = require "browser-sync"
del         = require "del"

path =
  src: "./src"
  compile: "./tmp"
  bower: "./bower_components"

errorLog = (err) ->
  console.log(">> ERROR <<")
  console.log(err)
  this.emit('end')


gulp.task "browser-sync", ->
  browserSync
    port: 3000
    server:
      baseDir: path.compile
      # middleware: [historyApi]
      routes:
        '/bower_components': 'bower_components'

# Scripts Task
# Compile to js file
# Uglifies
gulp.task 'scripts', ->
    gulp.src([
            "#{ path.src }/**/*.coffee"
        ])
        .pipe(plumber(errorLog))
        .pipe(coffee(bare: true))
        # .pipe(uglify())
        .pipe gulp.dest(path.compile)

# Styles Task
# Compile to css file
# Compressed
gulp.task 'styles', ->
    gulp.src("#{ path.src }/**/*.scss")
        .pipe(plumber(errorLog))
        .pipe sass({outputStyle: 'compressed'})
        .pipe gulp.dest(path.compile)

# Templates Task
gulp.task 'templates', ->
    gulp.src([
            "#{ path.src }/**/*.jade"
        ])
        .pipe(plumber(errorLog))
        .pipe(jade(pretty: true))
        .pipe gulp.dest(path.compile)

# Watch Task
gulp.task 'watch', ->

    gulp.watch [
        "#{ path.src }/**/*.jade"
    ],[
        'templates'
        browserSync.reload
    ]

    gulp.watch [
        "#{ path.src }/**/*.scss"
    ],[
        'styles'
        browserSync.reload
    ]

    gulp.watch [
        "#{ path.src }/**/*.coffee"
    ],[
        'scripts'
        browserSync.reload
    ]

gulp.task "clean", (cb) ->
  del([
        path.compile
    ],cb)

gulp.task('default', ['scripts', 'styles', 'templates', 'browser-sync', 'watch'])