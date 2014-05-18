# Minifying files

To minify JavaScript files (for production environment):
`npm install --save gulp-uglify`
```coffee
uglify  = require 'gulp-uglify'

gulp.task 'minify',
['vendor', 'bower', 'coffee'], # coffee files must be compiled to js first
(done) ->
	gulp.src parameters.web_path+'/js/**.js'
	.pipe uglify outSourceMap: true
	.pipe gulp.dest parameters.web_path+'/js'
	.on 'error', gutil.log
```
