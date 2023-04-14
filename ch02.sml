(* 2.1 *)
fun bin (n,0) = 1
  | bin (n,k) = if n = k
                then 1
                else bin (n-1, k-1) + bin (n-1, k)

(* 2.2 *)
fun pow (s,0) = ""
  | pow (s,n) = s ^ pow(s,n-1)

(* 2.6 *)
fun notDivisible (d,n) = not (n mod d = 0)

(* 2.7a *)
fun test (a,b,c) = a > b orelse (notDivisible(a,c) andalso test(a+1,b,c))

(* 2.7b *)
fun prime n = test(2,n-1,n)

(* 2.7c *)
fun helper n = if prime(n)
                then n
                else helper(n+1)

fun nextPrime n = helper(n+1)


