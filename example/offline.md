# Create an offline mode

Our apps could benefit easily from HTML5's offline capabilities using the [application cache](http://www.html5rocks.com/en/tutorials/appcache/beginner) and it's manifest file.
It should be no worries to set up except you have to maintain the manifest file up to date with the list of what you want to be cached.
It'll be good to automate this process.

We can use the plugin `gulp-manifest` dedicated to this task:
`npm install --save gulp-manifest'`
```coffee
manifest      = require 'gulp-manifest'

gulp.task 'manifest',
['vendors', 'jade', 'less', 'coffee', 'minify'], -> # Requires the files to have been compiled and eventually minified
->
  gulp.src parameters.web_path+'/**'
  .pipe manifest
      hash: true # I want my manifest to be contain a hash of its content the client will know when it has changed
      timestamp: false
      preferOnline: true
      fallback: [
        'api/picture/ images/placeholder.png' # For example, I don't want my user to store all the pictures that could be served by the app dynamically, I indicate he can use a placeholder instead.
        ]
      filename: parameters.manifest_file
      exclude: [
        parameters.manifest_file
        'robots.txt'
        ]
  )
  .pipe replace new RegExp('\/%20', 'g'), '/ ' # Fix spaces escaping in fallback section
  .pipe gulp.dest parameters.web_path

gulp.task 'assets', ['clean'], ->
  gulp.src parameters.assets_path + '/**'
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log
```

You'll see your generated manifest in the public folder, along with your other app's files.
