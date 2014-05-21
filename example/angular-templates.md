# Angular templates

For Angular apps, you may want all your `.jade` files inside modules to be incorporated in your javascripts, avoiding a request each time a template should be loaded.
`gulp-angular-templatecache` takes care fo that:
`npm install --save gulp-angular-templatecache'`
```coffeescript
templateCache      = require 'gulp-angular-templatecache'

 gulp.src parameters.app_path + '/*/**/*.jade' # All jades inside modules (not the main index.jade file!)
  .pipe jade doctype: 'html'
  .pipe templateCache
    filename: parameters.templates_file
    module: parameters.templates_module
    standalone: false # True if you want it to be a separate module
  .pipe gulp.dest parameters.web_path + '/js'
  .on 'error', gutil.log
```

You'll see your generated manifest in the public folder, along with your other app's files.
