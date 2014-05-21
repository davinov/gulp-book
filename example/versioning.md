# Versioning your files

Now that your app could be accessed offline, you might still want a way to indicates your user that a new version is available and to make him use it without having to explicitly empty his cache.

With `gulp-rev` takes care fo that:
`npm install --save gulp-rev'`

This is an example for versioning our css:
```coffee
rev = require 'gulp-rev'

gulp.task 'styles', ->
  gulp.src parameters.lstyles_main_file
  .pipe less paths: [ path.join(__dirname) ] # or sass()
  .pipe rev()
  .pipe gulp.dest parameters.web_path+'/css'
  .on 'error', gutil.log
```

Our `app.css` file is now called `app-someHash1234567f.css`.
We need then to change `app.css` references in other files, like `index.html` so the right file is used and the client has no 404s.

`gulp-rev` docs gives some insights to do that in their (integration guide)[https://github.com/sindresorhus/gulp-rev/blob/master/integration.md].
I personally just replace the references using native `replace` in JavaScript:

```coffee
gulp.task 'styles', ->
  gulp.src parameters.styles_main_file
  .pipe less paths: [ path.join(__dirname) ] # or sass()
  .pipe rev()
  .pipe gulp.dest parameters.web_path+'/css'
  .pipe rename 'rev-manifest-css.json' # Generates a manifest to map old file names with new ones
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log

gulp.task 'references', ['styles', 'jade'], ->
  revManifest = {}
  # Read file manifests
  for fileName in fs.readdirSync parameters.web_path
    _.extend revManifest, JSON.parse fs.readFileSync parameters.web_path+'/'+fileName, 'utf8' if /^(rev-manifest)/.test fileName

  # Strip absolute paths
  replacements = {}
  for oldFileName, revFileName of revManifest
    replacements[oldFileName.replace(parameters.app_path, '')] = revFileName.replace(parameters.app_path, '')

  # Replace paths in index.html
  gulpStream = gulp.src [parameters.web_path+'/index.html']
  gulpStream.setMaxListeners 20 # Increase listener limit to avoid warning message from node
  for oldFileName, revFileName of replacements
    gulpStream.pipe replace new RegExp(oldFileName, 'g'), revFileName
  gulpStream.pipe gulp.dest parameters.web_path
```
