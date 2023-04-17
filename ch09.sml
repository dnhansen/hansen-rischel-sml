(* 9.2(a) *)

fun sum (p, xs) = foldr (fn (x,y) => if p x then x + y else y) 0 xs

(* 9.2(b) *)

exception EmptyList

fun smallest [] = raise EmptyList
  | smallest (x::xs) = foldr (fn (y,z) => if y < z then y else z) x xs


(* 9.3 *)

fun min f =
  let
    fun aux n = if f n = 0
                then n
                else aux (n+1)
  in
    aux 0
  end

(* 9.4 *)

fun aux 0 = []
  | aux n = n :: aux (n-1)

fun downto1 f n e =
  if n > 0 then
   foldl f e (aux n)
  else
   e

fun fact n = downto1 op* n 1

(* 9.5 *)

fun curry f x y = f (x,y)

fun uncurry f (x,y) = f x y

