# terminal-illness

A simple racket library to write colourful text in the linux terminal. ISC-licensed.

## Warning
I spent more time writing this document than I did writing the library. If you are looking to write anything serious, or if you are bothered by my proper spelling of colour, please head over to the much more ambitious project [terminal-color (SIC) by hopkinsr](https://github.com/hopkinsr/terminal-color), which not only has fancy documentation, but is also cross-platform.

This library was not planned in any way, and is not tested. It works for me. I use it to write colourful messages to a small LCD screen attached to my Raspberry Pi.

## Documentation

Everything in this library is, even things that could have been regular strings, a procedure. I think this is coherent. 

### Colours
For the colours black, green, red, yellow, blue, magenta, cyan and white I provide the following procedures:

(_colour_ \[str\]) - returns a colourful string. e.g. (green "hello") returns "hello" with the escape sequence \e[32m prepended, and whatever you have set as the default style appended. If you omit the string, it just returns the colour code, without resetting. so a (blot (green) "hello") would print hello (and any text afterwards) in green unless you set something else.

(bg-_colour_ \[str\]) - Same as above, but changes the background colour.

### Bold
(bold str) - prints str bold. Because of how bold works, there is no way to un-bold without resetting all other formatting.

(start-bold) - returns the string to start writing bold. You have to display it for it to work.

(stop-bold) -  returns reset formatting string. You have to display it for it to work. 

(display-bold str)  and (displayln-bold str). Does what you think. 

### Underline

(underline str) (start-underline) (stop-underline) (display-underline str) (displayln-underline str). Works as bold, but does not reset the formatting.

### Convenience functions

(space) returns a space.

(blot str ...) (blotln str ...) (blotlns str ...) -  writes out all the arguments. This way you can do (blot (green "OK?") (space) (red "NO!"))

(clear) -  returns a clear escape-sequence

(display-clear) - clears the display 

(reset) - returns a reset format sequence

(display-reset) - displays a reset sequence, removing all the formatting.

## Not so FAQ

I haven't gotten any questions at all actually, so I'm just making them up.

**Why are you using Racket? I can't install it on my RPi without X! It's bloat!**  
I wanted to use Chicken Scheme, but I was too stupid to grok their macro system in 10 minutes.

**Why didn't you just use terminal-color?**  
Didn't know it existed, and when I found it I much preferred my way of doing/spelling it.



