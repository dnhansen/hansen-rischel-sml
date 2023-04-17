(* 8.1 *)

infix 6 ++ --
infix 7 ** //

datatype fexpr = Const of real
               | X
               | ++ of fexpr * fexpr | -- of fexpr * fexpr
               | ** of fexpr * fexpr | // of fexpr * fexpr
               | Sin of fexpr | Cos of fexpr
               | Ln of fexpr | Exp of fexpr

fun D (Const _) = Const 0.0
  | D X = Const 1.0
  | D (fe1 ++ fe2) = (D fe1) ++ (D fe2)
  | D (fe1 -- fe2) = (D fe1) -- (D fe2)
  | D (fe1 ** fe2) = (D fe1) ** fe2 ++ fe1 ** (D fe2)
  | D (fe1 // fe2) = ((D fe1) ** fe2 -- fe1 ** (D fe2)) // (fe2 ** fe2)
  | D (Sin fe) = (Cos fe) ** (D fe)
  | D (Cos fe) = ((Const ~1.0) ** (Sin fe)) ** (D fe)
  | D (Ln fe) = (D fe) // fe
  | D (Exp fe) = (Exp fe) ** (D fe)

fun red (Const a ++ Const 0.0) = Const a
  | red (Const 0.0 ++ Const a) = Const a
  | red (Const a ** Const 1.0) = Const a
  | red (Const 1.0 ** Const a) = Const a
  | red (Const a ** Const 0.0) = Const 0.0
  | red (Const 0.0 ** Const a) = Const 0.0
  | red (Const a ++ Const b) = Const (a+b)
  | red (Const a -- Const b) = Const (a-b)
  | red (Const a ** Const b) = Const (a*b)
  | red (Const a // Const b) = Const (a/b)
  | red (fe1 ++ fe2) = (red fe1) ++ (red fe2)
  | red (fe1 -- fe2) = (red fe1) -- (red fe2)
  | red (fe1 ** fe2) = (red fe1) ** (red fe2)
  | red (fe1 // fe2) = (red fe1) // (red fe2)
  (* ... *)
  | red x = x


