# Development watcher and server

Like Brunch, Gulp can help you watch your file changes and serves them to some `localhost:port` address while you're developing.

`npm install --save gulp-watch gulp-serve'`

```coffee
serve = require 'gulp-serve'

gulp.task 'watch',
['build'], # After all build tasks are done
->
  gulp.watch parameters.app_path + '/**/*.coffee', ['coffee' ]
  gulp.watch parameters.app_path + '/**/*.(less|saas)', ['styles', 'manifest', 'references'] # Manifest and references task is necessary if these files are versioned
  gulp.watch parameters.app_path + '/*.jade', ['jade', 'references'] # References task only for files that contain references (but are not versioned, typically index.(jade|html))
  gulp.watch parameters.app_path + '/*/**/*.jade', ['templates']
  gulp.watch parameters.assets_path, ['assets']
  gulp.watch 'bower.json', ['vendors']
```

```coffee
gulp.task 'serve', ['build'], serve parameters.web_path
```

`gulp serve` launch your server, `gulp watch` rebuild your files when needed.
