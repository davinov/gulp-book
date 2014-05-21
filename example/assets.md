# Other assets files

Copying other assets into our public directory is ridiculously simple):
`npm install --save gulp-copy`
```coffeescript
gulp.task 'assets', ->
  gulp.src parameters.assets_path + '/**'
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log
```

Way too easy.
