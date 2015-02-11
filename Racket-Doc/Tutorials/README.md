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

5 Server Thread

Once we stop server with Ctrl-C, we can't reuse same port.
so write code hoge hoge...

```
> (enter! "serve.rkt")
> (define stop (serve 5432))
> (stop)
> (define stop (serve 5432))
> (stop)
```

6 Connection Thread

Support multiple connection.
write hoge hoge...

```
> (enter! "serve.rkt")
> (define stop (serve 5432))
```

access the server drom browser twice quickly, and we recognize it.

7 Terminating Connections

For closing resources, write code hoge hoge...

```
-> (enter! "serve.rkt")
"serve.rkt"> (define stop (serve 8081))
"serve.rkt"> (define-values (cin cout) (tcp-connect "localhost" 8081))
"serve.rkt"> (read-line cin)
#<eof>
"serve.rkt"> (define-values (cin2 cout2) (tcp-connect "localhost" 8081))
"serve.rkt"> (stop)
"serve.rkt"> (read-line cin2)
#<eof>
```
