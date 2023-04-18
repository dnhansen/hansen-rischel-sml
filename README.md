# Hansen & Rischel: *Introduction to Programming Using SML*

## REPL

The SML/NJ REPL `sml` is quite bad, but most of its defects can be fixed by running `rlwrap sml` instead. Add the following alias to `~/.bashrc`:

    alias sml='rlwrap sml'


## Chapter 5: Lists

See [MLton](http://mlton.org/ValueRestriction) for more on the value restriction rule. Essentially, only non-expansive expressions are allowed as the right-hand side of a value declaration, when this would result in the identifier being declared having a polymorphic type. For instance, the declarations

    val xs = []
    val f  = fn x => x

are allowed, but the declarations

    val xs = rev []
    val f  = let in fn x => x end

are not allowed since `xs` and `f` would have types `'a list` and `'a -> 'a` respectively, and the right-hand sides are not non-expansive (so just 'expansive'?). It is not possible to circumvent this by adding type annotations with type variables.


## Chapter 8: Finite trees

It is easy to declare *directly* (as opposed to indirectly/mutually) recursive types, e.g.

    datatype mytype = Nil | Cons of mytype * int

However, one cannot simply declare an alias for the parameter `mytype * int` to the type constructor, as in

    datatype mytype = Nil | Cons of typealias
    type typealias = mytype * int

or the other way around. Instead one must use the `withtype` keyword:

    datatype mytype = Nil | Cons of typealias
    withtype typealias = mytype * int

Similarly, the `and` keyword is used to declare mutually recursive types where both would otherwise be declared using `datatype` declarations:

    datatype mytype1 = Nil1 | Cons1 of mytype2
    and      mytype2 = Nil2 | Cons2 of mytype1


## Chapter 10: Finite sets

Note that since sets do not have an ordering, the function `fold` for sets only makes sense with arguments `f b s` if the value of `List.fold f b s` is independent of the ordering of the underlying list `s`.
