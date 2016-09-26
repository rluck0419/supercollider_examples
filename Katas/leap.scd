(
~leap = {
	|year|
	var is_leap = false, leaped = false;
	if (year % 100 == 0, { is_leap = (year % 400 == 0); leaped = true });
	if (leaped == false, { year % 4 == 0 });
	is_leap;
}
)

~leap.value(1996);
~leap.value(1997);
~leap.value(1998);
~leap.value(1900);
