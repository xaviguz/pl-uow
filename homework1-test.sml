
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
val test_case14 = assert( dates_in_month([date1, date2, date3, date4], 9), [date1, date2])
val test_case15 = assert( dates_in_month([date1, date2, date3, date4], 11), [])
val test_case16 = assert( dates_in_month([date1, date2, date3, date4], 12), [date4])

(* test cases for dates_in_months function *)
val test_case17 = assert( dates_in_months([date1, date2, date3, date4], [11]), [])
val test_case18 = assert( dates_in_months([date1, date2, date3, date4], [12]), [date4])
val test_case19 = assert( dates_in_months([date1, date2, date3, date4], [9, 10, 12]), [date1, date2, date3, date4])

fun assert(result: string, expected: string) = 
    result = expected

val str1 = "amir"
val str2 = "moulavi"
val str3 = "sml"

(* test cases for get_nth function *)
val test_case20 = assert( get_nth([str1, str2, str3], 1), str1)
val test_case21 = assert( get_nth([str1, str2, str3], 2), str2)

(* test cases for date_to_string function *)
val test_case22 = assert( date_to_string((2012, 9, 12)), "September 12, 2012")
val test_case23 = assert( date_to_string((2000, 1, 13)), "January 13, 2000")
val test_case24 = assert( date_to_string((1998, 12, 30)), "December 30, 1998")

fun assert(result: int, expected: int) = 
    result = expected

(* test cases for number_before_reaching_sum function *)
val test_case25 = assert( number_before_reaching_sum(12, [10, 13, 10]), 2)
val test_case26 = assert( number_before_reaching_sum(8, [10, 13, 10]), 1)
val test_case27 = assert( number_before_reaching_sum(24, [10, 13, 10]), 3)

(* test cases for what_month function *)
val test_case28 = assert( what_month(45), 2)
val test_case29 = assert( what_month(60), 3)
val test_case30 = assert( what_month(364), 12)
val test_case29_2 = assert( what_month(59), 2)

fun assert(xs1: int list, xs2: int list) = 
    if null xs1 andalso null xs2
    then true
    else if null xs1 andalso not (null xs2)
    then false
    else if not (null xs1) andalso null xs2
    then true
    else let val equalElem = if hd xs1 = hd xs2 then true else false in
	     if equalElem 
	     then assert(tl xs1, tl xs2)
	     else false
	 end

(* test cases for month_range function *)
val test_case31 = assert( month_range(45, 46), [2, 2])
val test_case32 = assert( month_range(58, 60), [2, 2, 3])

fun assert(result: (int*int*int) option, expected: (int*int*int) option) =
    result = expected

(* test cases for oldest function *)
val test_case33 = assert( oldest([date1, date2, date3, date4]), SOME(date3) )
val test_case34 = assert( oldest([date1, date2, date4]), SOME(date1) )
val test_case35 = assert( oldest([]), NONE )
