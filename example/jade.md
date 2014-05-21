# Compiling Jade files

To compile the jade files in `app/` to the `_public/` folder:
`npm install --save gulp-jade`
```coffeescript
jade    = require 'gulp-jade'

gulp.task 'jade', ->
  gulp.src parameters.app_path + '/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log
```

