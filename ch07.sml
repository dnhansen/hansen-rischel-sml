(* 7.1 *)
(*
datatype solution = Two of real * real | One of real | No
type quadratic = real * real * real (* a,b,c *)

fun solve (0,_,_) = No
  | solve (a,b,c) =
    let
      val d = b*b - 4.0*a*c
    in
      if d = 0.0
      then One (~b / (2*a))
      else Two ((~b + Math.sqrt d) / (2*a), (~b - Math.sqrt d) / (2*a))
    end
    *)

(* 7.2 *)

fun smallest [] = NONE
  | smallest (x::xs) =
    let
      fun aux (small, []) = SOME small
        | aux (small, y::ys) = if small <= y
                               then aux (small, ys)
                               else aux (y, ys)
    in
      aux (x, xs)
    end

(* 7.3 *)

fun partition (_, []) = ([],[],[])
  | partition (x, y::ys) =
    let
      val (ss,es,gs) = partition (x, ys)
    in
      if y < x
      then (y :: ss, es, gs)
      else if y = x
      then (ss, y :: es, gs)
      else (ss, es, y :: gs)
    end

(* Tail recursive solution, but doesn't preserve order.
 * Can just add List.rev to preserve order, but exercise doesn't require it. *)

fun partition' (x, ys) =
  let
    fun aux (smaller, equal, greater, []) = (smaller, equal, greater)
      | aux (smaller, equal, greater, z::zs) = if z < x
                                               then aux (z :: smaller, equal,
                                               greater, zs)
                                               else if z = x
                                                    then aux (smaller, z :: equal,
                                               greater, zs)
                                                    else aux (smaller, equal, z ::
                                                    greater, zs)
  in
    aux ([], [], [], ys)
  end

