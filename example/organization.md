# Project organization

Considering my target organization:

        app/
            assets/
                images/
                    ...
                downloads/
                    ...
            module1/
                *.coffee
                *.jade
                *.less
            module2/
                ...
            ...
            app.coffee
            app.(less|saas)
            index.jade
        build/
            gulpfile.coffee
        config/
            parameters.coffee
        vendor/
            lib1.js
            lib2.js
            ...
        bower.json
        gulpfile.js
        package.json
        node_modules/
            ...
        bower_components/
            ...
        _public/
            images/
                ...
            downloads/
                ...
            css/
            js/
                app.js
                vendor.js
                bower-vendor.js
            index.html

Let's start writing the `Gulpfile`!

## Using CoffeeScript for the Gulpfile

Following [this Gulp recipe](https://github.com/gulpjs/gulp/blob/master/docs/recipes/using-coffee-script-for-gulpfile.md):

`gulpfile.js`:
```js
require('coffee-script/register');
require('./build/gulpfile.coffee');
```

`build/gulpfile.coffee`:
```coffee
gulp = require 'gulp'
```

## App specific variables

To let app's specific parameters live in a separate config file:

`build/gulpfile.coffee`:
```coffee
parameters    = require '../config/parameters.coffee'
```

`config/parameters.coffee`:
```coffee
app_path = 'app'

config =

  app_path: app_path
  web_path: '_public'
  vendor_path: 'vendor'
  assets_path: app_path + '/assets'

  app_main_file: 'app.js'
  css_main_file: 'app.css'
  styles_main_file: app_path + '/app.less' # or app.sass if you prefer SASS
  templates_file: 'app.templates.js'
  templates_module: 'myapp'
  vendor_main_file: 'vendor.js'
  bower_main_file: 'bower-vendor.js'
  manifest_file: 'myapp.appcache'

module.exports = config
```

