# Hansen & Rischel: *Introduction to Programming Using SML*

## REPL

The SML/NJ REPL `sml` is quite bad, but most of its defects can be fixed by running `rlwrap sml` instead. Add the following alias to `~/.bashrc`:

    alias sml='rlwrap sml'


## Chapter 5: Lists

See [MLton](http://mlton.org/ValueRestriction#_alternatives_to_the_value_restriction) for more on the value restriction rule. Essentially, only non-expansive expressions are allowed as the right-hand side of a value declaration, when this would result in the identifier being declared having a polymorphic type. For instance, the declarations

    val xs = []
    val f  = fn x => x

are allowed, but the declarations

    val xs = rev []
    val f  = let in fn x => x end

are not allowed since `xs` and `f` would have types `'a list` and `'a -> 'a` respectively, and the right-hand sides are not non-expansive (so just 'expansive'?). It is not possible to circumvent this by adding type annotations with type variables.
