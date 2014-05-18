# Handling dependencies

## Manually added
To include external libs placed in `vendor/` in a `vendor.js` file:

```coffee
gulp.task 'vendor', ->
    gulp.src parameters.vendor_path+'/**/*.js'
    .pipe concat parameters.vendor_main_file
    .pipe gulp.dest parameters.web_path+'/js'
    .on 'error', gutil.log
```

## Using Bower
To read automatically `bower.json` and put the corresponding files in `bower-vendors.js`:
`npm install --save gulp-bower-files`
```coffee
bowerFiles    = require 'gulp-bower-files'

gulp.task 'bower', ->
    bowerFiles()
      .pipe filter '**/*.js'
      .pipe concat parameters.bower_main_file
      .pipe gulp.dest parameters.web_path+'/js'
      .on 'error', gutil.log
```

