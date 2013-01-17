
fun assert_bool(result: bool, expected: bool) =
    result = expected
    
fun assert_int(result: int, expected: int) =
    result = expected

fun assert_date_list(dates1: (int*int*int) list, dates2: (int*int*int) list) = 
    if null dates1 andalso null dates2
    then true
    else if null dates1 andalso not (null dates2)
    then false
    else if not (null dates1) andalso null dates2
    then true
    else let val equalElem = if hd dates1 = hd dates2 then true else false in
	     if equalElem 
	     then assert_date_list(tl dates1, tl dates2)
	     else false
	 end

fun assert_str(result: string, expected: string) = 
    result = expected

fun assert_int_list(xs1: int list, xs2: int list) = 
    if null xs1 andalso null xs2
    then true
    else if null xs1 andalso not (null xs2)
    then false
    else if not (null xs1) andalso null xs2
    then true
    else let val equalElem = if hd xs1 = hd xs2 then true else false in
	     if equalElem 
	     then assert_int_list(tl xs1, tl xs2)
	     else false
	 end

fun assert_date_option(result: (int*int*int) option, expected: (int*int*int) option) =
    result = expected

val date1 = (1982, 9, 21)
val date2 = (1982, 9, 29)
val date3 = (1980, 10, 10)
val date4 = (2012, 12, 31)
val date5 = (2012, 11, 31)

(* test cases for is_older function *)
val test_case1 = assert_bool( is_older(date1, date1), false)
val test_case2 = assert_bool( is_older(date1, date2), true)
val test_case3 = assert_bool( is_older(date2, date1), false)
val test_case4 = assert_bool( is_older(date3, date4), true)
val test_case5 = assert_bool( is_older(date4, date3), false)
val test_case6 = assert_bool( is_older(date5, date4), true)

(* test cases for number_in_month function *)
val test_case7 = assert_int( number_in_month([date1, date2, date3, date4], 9), 2 )
val test_case8 = assert_int( number_in_month([date1, date2, date3, date4], 12), 1 )
val test_case9 = assert_int( number_in_month([], 9), 0 )
val test_case10 = assert_int( number_in_month([date1, date2, date3, date4], ~9), 0 )

(* test cases for number_in_months function *)
val test_case11 = assert_int( number_in_months([date1, date2, date3, date4], [9, 10]), 3 )
val test_case12 = assert_int( number_in_months([date1, date2, date3, date4], [12, 10]), 2 )
val test_case13 = assert_int( number_in_months([date1, date2, date3, date4], [6]), 0 )
val test_case14 = assert_int( number_in_months([date1, date2, date3, date4], []), 0 )

(* test cases for dates_in_month function *)
val test_case15 = assert_date_list( dates_in_month([date1, date2, date3, date4], 9), [date1, date2])
val test_case16 = assert_date_list( dates_in_month([date1, date2, date3, date4], 11), [])
val test_case17 = assert_date_list( dates_in_month([date1, date2, date3, date4], 12), [date4])

(* test cases for dates_in_months function *)
val test_case18 = assert_date_list( dates_in_months([date1, date2, date3, date4], [11]), [])
val test_case19 = assert_date_list( dates_in_months([date1, date2, date3, date4], [12]), [date4])
val test_case20 = assert_date_list( dates_in_months([date1, date2, date3, date4], [9, 10, 12]), [date1, date2, date3, date4])

val str1 = "amir"
val str2 = "moulavi"
val str3 = "sml"

(* test cases for get_nth function *)
val test_case21 = assert_str( get_nth([str1, str2, str3], 1), str1)
val test_case22 = assert_str( get_nth([str1, str2, str3], 2), str2)

(* test cases for date_to_string function *)
val test_case23 = assert_str( date_to_string((2012, 9, 12)), "September 12, 2012")
val test_case24 = assert_str( date_to_string((2000, 1, 13)), "January 13, 2000")
val test_case25 = assert_str( date_to_string((1998, 12, 30)), "December 30, 1998")

(* test cases for number_before_reaching_sum function *)
val test_case26_1 = assert_int( number_before_reaching_sum(12, [10, 13, 10]), 1)
val test_case27_1 = assert_int( number_before_reaching_sum(8, [10, 13, 10]), 0)
val test_case28_1 = assert_int( number_before_reaching_sum(24, [10, 13, 10]), 2)
val test_case28_2 = assert_int( number_before_reaching_sum(10, [1,2,3,4,5]), 3)
val test_case28_3 = assert_int( number_before_reaching_sum(6, [4,1,1,1]), 2)
val test_case28_4 = assert_int( number_before_reaching_sum(1, [2]), 0)

(* test cases for what_month function *)
val test_case29 = assert_int( what_month(45), 2)
val test_case30 = assert_int( what_month(60), 3)
val test_case31 = assert_int( what_month(364), 12)
val test_case32 = assert_int( what_month(59), 2)

(* test cases for month_range function *)
val test_case33 = assert_int_list( month_range(45, 46), [2, 2])
val test_case34 = assert_int_list( month_range(58, 60), [2, 2, 3])

(* test cases for oldest function *)
val test_case35 = assert_date_option( oldest([date1, date2, date3, date4]), SOME(date3) )
val test_case36 = assert_date_option( oldest([date1, date2, date4]), SOME(date1) )
val test_case37 = assert_date_option( oldest([]), NONE )

(* test cases for exists *)
val test_case38 = assert_bool( exists(2, [2,3,4]), true)
val test_case39 = assert_bool( exists(4, [2,3,4]), true)
val test_case40 = assert_bool( exists(3, [2,3,4]), true)
val test_case41 = assert_bool( exists(20, [2,3,4]), false)
val test_case42 = assert_bool( exists(2, []), false)

(* test cases for remove_duplicates *)
val test_case43 = assert_int_list( remove_duplicates([2,3,4,2,3]), [2,3,4])
val test_case44 = assert_int_list( remove_duplicates([2,2,2,2,2]), [2])

(* test cases for number_in_months_challenge function *)
val test_case45 = assert_int( number_in_months_challenge([date1, date2, date3, date4], [9, 9, 10, 10]), 3 )
val test_case46 = assert_int( number_in_months_challenge([date1, date2, date3, date4], [12, 10, 12, 12, 10]), 2 )
val test_case47 = assert_int( number_in_months_challenge([date1, date2, date3, date4], [6, 6, 6, 6]), 0 )
val test_case48 = assert_int( number_in_months_challenge([date1, date2, date3, date4], []), 0 )

(* test cases for dates_in_months_challenge function *)
val test_case49 = assert_date_list( dates_in_months_challenge([date1, date2, date3, date4], [11, 11, 11]), [])
val test_case50 = assert_date_list( dates_in_months_challenge([date1, date2, date3, date4], [12, 12, 12]), [date4])
val test_case51 = assert_date_list( dates_in_months_challenge([date1, date2, date3, date4], [9, 10, 12, 9, 10, 11]), [date1, date2, date3, date4])

