
## Building the book

A few prerequisites are handled by Rake tasks:

 - font: [ET Bembo](https://en.wikipedia.org/wiki/Bembo) 
 - body text from https://www.inf.ufpr.br/renato/profession.html

``` shell
rake
```

## Dev

Use [filewatcher](https://github.com/filewatcher/filewatcher-cli).

``` shell
filewatcher profession.pdf.rb 'ruby profession.pdf.rb'
```
