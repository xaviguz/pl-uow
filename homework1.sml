
(* PL course - Homework 1 *)
val MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
val DAYS_IN_MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

fun yearOf(date: (int*int*int)) = #1 date
fun monthOf(date: (int*int*int)) = #2 date
fun dayOf(date: (int*int*int)) = #3 date

(* P1 - returns true if date1 is older than date2 *)
fun is_older(date1: (int*int*int), date2: (int*int*int)) =
    if date1 = date2 then false
    else if yearOf(date1) < yearOf(date2) then true
    else if yearOf(date1) > yearOf(date2) then false
    else if monthOf(date1) < monthOf(date2) then true
    else if monthOf(date1) > monthOf(date2) then false
    else if dayOf(date1) < dayOf(date2) then true
    else false

(* P2 - returns the number of matching dates with the given month *)
fun number_in_month(dates: (int*int*int) list, month: int) = 
    if null (dates) orelse month < 0 then 0
    else if monthOf(hd dates) = month
	 then 1 + number_in_month(tl dates, month)
	 else number_in_month(tl dates, month)

(* P3 - returns the number of matching dates with the given list of months *)
fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* P4 - returns list of dates that matches a given month *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates orelse month < 0 then []
    else if monthOf(hd dates) = month
         then hd dates :: dates_in_month(tl dates, month)
	 else dates_in_month(tl dates, month)

(* P5 - returns list of dates that matches given months *)
fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null dates orelse null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* P6 - returns the nth element of a list of strings *)
fun get_nth(strings: string list, n: int) = 
    if n = 1 then hd strings
    else get_nth(tl strings, n - 1)

(* P7 - returns the string representation of a date *)
fun date_to_string(date: (int*int*int)) =
    get_nth(MONTHS, monthOf(date)) ^ " " ^ Int.toString(dayOf(date)) ^ ", " ^ Int.toString(yearOf(date))

(* P8 - returns the index of the 'n'th element of the list such that the sum of first 'n+1' element is greater than 'sum' *)
fun number_before_reaching_sum(sum: int, xs: int list) =
    let 
	fun helper(index: int, acc_sum: int, xss: int list) = 
	    if acc_sum + hd xss >= sum then index
	    else helper(index + 1, acc_sum + hd xss, tl xss)
    in 
	helper(0, 0, xs)
    end

(* P9 - returns what month a day belongs *)
fun what_month(day:int) =
    number_before_reaching_sum(day, DAYS_IN_MONTHS) + 1

(* P10 - returns months that are within [day1, day2] *)
fun month_range(day1: int, day2: int) = 
    if day1 > day2 then []
    else what_month(day1) :: month_range(day1 + 1, day2)
    
(* P11 - returns the oldest dates *)
fun oldest(dates: (int*int*int) list) = 
    if null dates then NONE
    else
	let
	    fun find_oldest(current_element: (int*int*int), dates: (int*int*int) list) =
		if null dates then current_element
		else
		    if is_older(current_element, hd dates)
		    then find_oldest(current_element, tl dates)
		    else find_oldest(hd dates, tl dates)
	in
	    SOME (find_oldest(hd dates, tl dates))
	end

(* returns true of n is in xs list and false otherwise *)
fun exists(n: int, xs: int list) =
    if null xs then false
    else 
	if n = hd xs then true
	else exists(n, tl xs)
		
(* returns a set of int *)
fun remove_duplicates(xs: int list) = 
    let 
	fun remove_duplicates_helper(xs: int list, result: int list) = 
	    if null xs then result
	    else if not (exists(hd xs, result)) then remove_duplicates_helper(tl xs, result @ [hd xs])
	    else remove_duplicates_helper(tl xs, result)
    in
	remove_duplicates_helper(xs, [])
    end

(* P12 - challenge problem *)
fun number_in_months_challenge(dates: (int*int*int) list, months: int list) =
    let
	val unique_months = remove_duplicates(months)
    in
	number_in_months(dates, unique_months)
    end

(* P12 - challenge problem *)
fun dates_in_months_challenge(dates: (int*int*int) list, months: int list) = 
    let
	val unique_months = remove_duplicates(months)
    in
	dates_in_months(dates, unique_months)
    end
