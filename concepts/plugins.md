# Plugins

So it's in the `pipe`s that lives all the logic of your factory.
Each simple and single step is supposed to be realised by a gulp _plugin_.
A list of plugins can be browsed at [gulpjs.com/plugins](http://gulpjs.com/plugins/).

They're basically doing a compilation step, like minifying javascripts:
```js
uglify = require('gulp-uglify');

gulp.task('minify', function() {
    gulp.src('src/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('dist'));
});
```
> See [gulp-uglify repo](https://github.com/terinjokes/gulp-uglify).

You can install them using `npm install`.

