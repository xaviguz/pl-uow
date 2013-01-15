
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

