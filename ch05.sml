(* 5.1 *)
fun altsum [] = 0
  | altsum (x::xs) = x - altsum xs

(* 5.2 *)
fun rmodd [] = []
  | rmodd [x] = []
  | rmodd (x::x'::xs) = x' :: rmodd xs

(* 5.3 *)
fun combine [] = []
  | combine [_] = [] (* exercise underspecified *)
  | combine (x::x'::xs) = (x, x') :: combine xs

(* 5.6 *)
fun length [] = 0
  | length (_::xs) = 1 + length xs

fun take ([],_) = []
  | take (_, 0) = []
  | take (x::xs, n) = x :: take (xs, n-1)

fun drop ([],_) = []
  | drop (xs,0) = xs
  | drop (_::xs, n) = drop (xs, n-1)

(* 5.7 *)
fun remove_even [] = []
  | remove_even (x::xs) = if x mod 2 = 0
                          then remove_even xs
                          else x :: remove_even xs

(* 5.8 *)
fun number (_, []) = 0
  | number (x, y::ys) = if x = y
                        then 1 + number (x, ys)
                        else number (x, ys)

(* 5.9 *)
fun split [] = ([], [])
  | split [x] = ([x],[])
  | split (x::x'::xs) =
    let
      val (left, right) = split xs
    in
      (x :: left, x' :: right)
    end

(* 5.10 *)
fun prefix ([], _) = true
  | prefix (_, []) = false
  | prefix (x::xs, y::ys) = x = y andalso prefix (xs, ys)

(* 5.11 *)
local
  fun lowerChars [] = true
    | lowerChars (x::xs) = Char.isLower x andalso lowerChars xs
in
  fun lowerCaseOnly s = lowerChars (explode s)
end

