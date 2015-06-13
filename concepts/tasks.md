# Tasks

The `gulpfile` is organized in several _tasks_ that you can execute from command line using `gulp [task-name]`.

A task is defined using the [`gulp.task` function](https://github.com/gulpjs/gulp/blob/master/docs/API.md#gulptaskname-deps-fn).
To define a task that prints "Hello World", it's as simple as 
```js
gulp.task('hello', function() {
    console.log('Hello World');
});
```

Tasks can have dependencies, which means tasks that requires other tasks to be run before it.
```js
gulp.task('hello1', function() {
    console.log('Hello');
});

gulp.task('hello2', ['hello1'], function() {
    console.log('World');
});
```
    
Executing `hello2` task will print `Hello`, then `World`.

> The tasks defined in the dependency array are unordered.
This allows Gulp to execute some of them simultaneously.
While it could lead to sensible performance impovement by parralezing tasks, 
it could also be quite confusing if you want your raks to be ran one by one.

This code will try to print `Hel` and `lo` at the same time, so the order is unpredictable.
```js
gulp.task('hello1', function() {
    console.log('Hel');
});

gulp.task('hello2', function() {
    console.log('lo');
});

gulp.task('hello3', ['hello1', 'hello2'], function() {
    console.log('World');
});
```

This one is better:
```js
gulp.task('hello1', function() {
    console.log('Hel');
});

gulp.task('hello2', ['hello1'], function() {
    console.log('lo');
});

gulp.task('hello3', ['hello1', 'hello2'], function() { // So 'hello1' is unecessary there
    console.log('World');
});
```

You can also create empty tasks just to assign a common name to a set of dependencies:
```js
gulp.task('compile', ['jade2html', 'coffee2js', 'less2css']);
``` 

