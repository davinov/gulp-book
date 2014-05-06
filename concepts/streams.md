# Streams

Gulp is designed to process your files from one state to another.

I said earlier to imagine it as a factory.
It should have entry points for raw material and exit points for finished products.

`gulp.src` and `gulp.dest` are desgined exactly to do that: theses functions respectively starts the flow of files  and redirect the processed ones.
`pipe` function is the conveyor from a job to another. 

A dead simple example:
```js
gulp.task('copy-files', function() {
    gulp.src('source/folder/**')
        .pipe( gulp.dest('dest/folder/**') );
});
```
`gulp copy-files` will do the intended copy.

