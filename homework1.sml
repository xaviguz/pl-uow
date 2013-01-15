
(* PL course - Homework 1 *)

fun yearOf(date: (int*int*int)) = #1 date

fun monthOf(date: (int*int*int)) = #2 date

fun dayOf(date: (int*int*int)) = #3 date

fun is_older(date1: (int*int*int), date2: (int*int*int)) =
    if date1 = date2 then false
    else if yearOf(date1) < yearOf(date2) then true
    else if yearOf(date1) > yearOf(date2) then false
    else if monthOf(date1) < monthOf(date2) then true
    else if monthOf(date1) > monthOf(date2) then false
    else if dayOf(date1) < dayOf(date2) then true
    else false

fun number_in_month(dates: (int*int*int) list, month: int) = 
    if null (dates) orelse month < 0 
    then 0
    else if monthOf(hd dates) = month
	 then 1 + number_in_month(tl dates, month)
	 else number_in_month(tl dates, month)
	 
