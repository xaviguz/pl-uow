
fun assert(result: bool, expected: bool) =
    result = expected
    
val date1 = (1982, 9, 21)
val date2 = (1982, 9, 29)
val date3 = (1980, 10, 10)
val date4 = (2012, 12, 31)

(* test cases for is_older function *)
val test_case1 = assert( is_older(date1, date1), false)
val test_case2 = assert( is_older(date1, date2), true)
val test_case3 = assert( is_older(date2, date1), false)
val test_case4 = assert( is_older(date3, date4), true)
val test_case5 = assert( is_older(date4, date3), false)

fun assert(result: int, expected: int) =
    result = expected

(* test cases for number_in_month function *)
val test_case6 = assert( number_in_month([date1, date2, date3, date4], 9), 2 )
val test_case7 = assert( number_in_month([date1, date2, date3, date4], 12), 1 )
val test_case8 = assert( number_in_month([], 9), 0 )
val test_case9 = assert( number_in_month([date1, date2, date3, date4], ~9), 0 )

(* test cases for number_in_months function *)
val test_case10 = assert( number_in_months([date1, date2, date3, date4], [9, 10]), 3 )
val test_case11 = assert( number_in_months([date1, date2, date3, date4], [12, 10]), 2 )
val test_case12 = assert( number_in_months([date1, date2, date3, date4], [6]), 0 )
val test_case13 = assert( number_in_months([date1, date2, date3, date4], []), 0 )

fun assert(dates1: (int*int*int) list, dates2: (int*int*int) list) = 
    if null dates1 andalso null dates2
    then true
    else if null dates1 andalso not (null dates2)
    then false
    else if not (null dates1) andalso null dates2
    then true
    else let val equalElem = if hd dates1 = hd dates2 then true else false in
	     if equalElem 
	     then assert(tl dates1, tl dates2)
	     else false
	 end

(* test cases for dates_in_month function *)
val test_case14 = assert( dates_in_month([date1, date2, date3, date4], 9), [(1982, 9, 21),(1982, 9, 29)])
val test_case15 = assert( dates_in_month([date1, date2, date3, date4], 11), [])
val test_case16 = assert( dates_in_month([date1, date2, date3, date4], 12), [(2012, 12, 31)])
