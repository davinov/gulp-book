# Compiling Less files

To compile the less files to a css file in `_public/` folder:
`npm install --save gulp-less`
```coffee
path    = require 'path'
less    = require 'gulp-less'

gulp.task 'less', ->
  gulp.src parameters.less_main_file
  .pipe less paths: [ path.join(__dirname) ]
  .pipe gulp.dest parameters.web_path+'/css'
  .on 'error', gutil.log
```

