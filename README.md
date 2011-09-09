# JackScript

A tribute to the Shining, brainfuck style.

## DESCRIPTION

JackScript is a dialect of [Brainfuck](http://en.wikipedia.org/wiki/Brainfuck) based on various
capitalizations of "All work and no play makes Jack a dull boy". I have stolen the idea from a
[tweet](https://twitter.com/#!/dwineman/status/19805994867490816) from Dan Wineman. JackScript is
forked from [TrollScript](https://github.com/tombell/trollscript).

## INSTALLATION

You should figure it by yourself...

## USAGE

jackscript path/to/script.jack

### The Language

* `>` is `All work and no play makes Jack a dull boy. ` - increment the data pointer (to point to the next cell to the right)
* `<` is `All WORK and no PLAY makes Jack a DULL boy. ` - decrement the data pointer (to point to the next cell to the left)
* `+` is `ALL work and NO play makes Jack a dull boy. ` - increment (increase by one) the byte at the data pointer
* `-` is `ALL WORK and NO PLAY makes Jack a dull boy. ` - decrement (decrease by one) the byte at the data pointer
* `.` is `All work AND no play MAKES Jack a dull boy. ` - output a character, the ASCII value of which being the byte at the data pointer
* `,` is `ALL WORK AND NO PLAY makes Jack a dull boy. ` - accept one byte of input, storing its value in the byte at the data pointer
* `[` is `All work and no play MAKES JACK A DULL BOY. ` - if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching `]` command
* `]` is `ALL WORK AND NO PLAY MAKES JACK A DULL BOY. ` - if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching `[` command

### Forking

Feel free to do whatever you want, I don't plan to maintain any of this stuff.
