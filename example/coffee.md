# Compiling CoffeeScript files

To compile my files from `app/` to a single file in `_public/` folder:
`npm install --save gulp-coffee gulp-concat gulp-util`
```coffee
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'
gutil   = require 'gulp-util'

gulp.task 'coffee', (done) ->
  gulp.src parameters.app_path + '/**/*.coffee'
  .pipe coffee bare: true
  .pipe concat parameters.app_main_file
  .pipe gulp.dest parameters.web_path + '/js'
  .on 'error', gutil.log
```

