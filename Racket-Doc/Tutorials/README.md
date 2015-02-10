1 Ready...

```
$ r (alias racket in my env)
> (require xrepl)
> ,install!
```

So far, we can edit command line and complete symbol automatically. For example,

```
> (req                  ; Enter TAB KEY
> (require              ; Get it
```

2 Set...

write code hoge hoge...

3 Go!

We use code above "2 Set ...", so start repl.

```
> (enter! "serve.rkt")
> (go)
```

4 Hello World Server

write code hoge hoge...
and exec below in console.

```
> (enter! "serve.rkt")
> (serve 5555)
```

