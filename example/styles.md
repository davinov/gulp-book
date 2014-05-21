# Compiling stylesheets

To compile LESS files to CSS in `_public/` folder:
`npm install --save gulp-less`
```coffeescript
path    = require 'path'
less    = require 'gulp-less'

gulp.task 'less', ->
  gulp.src parameters.styles_main_file
  .pipe less paths: [ path.join(__dirname) ]
  .pipe gulp.dest parameters.web_path+'/css'
  .on 'error', gutil.log
```

## Using Sass
If you feel more like using [Sass](http://sass-lang.com/), it's basically the same, except for the plugin used:
`npm install --save gulp-sass`
```coffeescript
sass    = require 'gulp-sass'

gulp.task 'sass', ->
  gulp.src parameters.styles_main_file
  .pipe sass()
  .pipe gulp.dest parameters.web_path+'/css'
  .on 'error', gutil.log
```
