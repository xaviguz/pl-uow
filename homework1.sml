
(* PL course - Homework 1 *)

val MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

fun yearOf(date: (int*int*int)) = #1 date

fun monthOf(date: (int*int*int)) = #2 date

fun dayOf(date: (int*int*int)) = #3 date

(* returns true if date1 is older than date2 *)

fun is_older(date1: (int*int*int), date2: (int*int*int)) =
    if date1 = date2 then false
    else if yearOf(date1) < yearOf(date2) then true
    else if yearOf(date1) > yearOf(date2) then false
    else if monthOf(date1) < monthOf(date2) then true
    else if monthOf(date1) > monthOf(date2) then false
    else if dayOf(date1) < dayOf(date2) then true
    else false

(* returns the number of matching dates with the given month *)

fun number_in_month(dates: (int*int*int) list, month: int) = 
    if null (dates) orelse month < 0 
    then 0
    else if monthOf(hd dates) = month
	 then 1 + number_in_month(tl dates, month)
	 else number_in_month(tl dates, month)

(* returns the number of matching dates with the given list of months *)
	 
fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* returns list of dates that matches a given month *)

fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates orelse month < 0
    then []
    else if monthOf(hd dates) = month
         then hd dates :: dates_in_month(tl dates, month)
	 else dates_in_month(tl dates, month)

(* returns list of dates that matches given months *)

fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* returns the nth element of a list of strings *)

fun get_nth(strings: string list, n: int) = 
    if n = 1
    then hd strings
    else get_nth(tl strings, n - 1)

(* returns the string representation of a date *)

fun date_to_string(date: (int*int*int)) =
    get_nth(MONTHS, monthOf(date)) ^ " " ^ Int.toString(dayOf(date)) ^ ", " ^ Int.toString(yearOf(date))
