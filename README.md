# Gulp: the modern frontend factory

I'm excited everyday I write front-end code with these amazing tools we now have to build client-side apps with pleasure. 
I liked JavaScript but typing so many brackets was killing my keyboard, then I discovered [CoffeeScript](http://coffeescript.org). 
I was desperately trying to rationalize my copy and paste activity for selectors in CSS, but that before [LESS](http://lesscss.org) saved my life.
I got lost every time in the verbose HTML markup of long web pages, and couldn't stand losing time forgetting closing tags, so [Jade](http://jade-lang.com) felt like a spring cleaning to me.

All these languages (and others like LiveScript, SCSS, etc.) are (unfortunately?) not natively read by browsers we develop for, adding to our test and release process an extra building step.
It's here where tools like [Grunt](http://gruntjs.com) or [Brunch](http://brunch.io) were needed, automating this "compilation".

I personally used a lot Brunch as I considered it easier for common tasks in the stack I use, and I really appreciate his usability, and his *out of the box* behaviour.
I loved it so much I wrote a [kewl](http://david.nowinsky.net/kewl) skeleton to start prototyping quickly with it.
However, when I tried to use always more plugins to achieve more complex tasks, such as marking assets with a checksum, then adding them in a cache manifest file, I realized the limits of these tools, essentially because they're based on configuration, instead of code.

And then, I discovered [Gulp](http://gulpjs.com).

As developers, we love code. We'd like to know what's happening deep down when we call some obscure function.
Gulp get rid of this "black box" approach and proposes a radically different philosophy to create your perfect front-end factory.
