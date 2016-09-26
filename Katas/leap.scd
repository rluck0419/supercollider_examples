(
~leap = {
	|year|
	var is_leap = false;
	if (year % 100 == 0,
		{ is_leap = (year % 400 == 0) },
		{ is_leap = (year % 4 == 0) }
	);
	is_leap
}
)

~leap.value(1996);
~leap.value(1997);
~leap.value(1998);
~leap.value(1900);
~leap.value(1800);
~leap.value(2400);
~leap.value(2000);
