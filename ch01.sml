(* 1.1 *)
fun g n = n + 4

(* 1.2 *)
fun h (x,y) = Math.sqrt(x*x + y*y)

(* 1.3 *)
fun f 0 = 0
  | f n = n + f (n-1)

(* 1.4 *)
fun sum (m,0) = m
  | sum (m,n) = n + sum (m, n-1)

(* 1.5 *)
fun F 0 = 0
  | F 1 = 1
  | F n = F (n-1) + F (n-2)

