
## Building the book

A few prerequisites are handled by Rake tasks:

 - fonts:
  - [ET Bembo](https://en.wikipedia.org/wiki/Bembo) 
  - [Droid Sans Japanese](https://en.wikipedia.org/wiki/Droid_(typeface))
 - body text from https://www.inf.ufpr.br/renato/profession.html

``` shell
rake
```

## Dev

Use [filewatcher](https://github.com/filewatcher/filewatcher-cli).

``` shell
filewatcher profession.pdf.rb 'ruby profession.pdf.rb'
```

## Texture and the necessary evil it creates: hyphenation

[Hyphenation is complex](https://english.stackexchange.com/questions/385/what-are-the-rules-for-splitting-words-at-the-end-of-a-line).
