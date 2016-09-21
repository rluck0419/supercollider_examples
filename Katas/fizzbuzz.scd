(
~fizzbuzz = Array.fill(100, {
	arg i, item=i+1;
	if (i+1 / 5 == (i+1 / 5).round, { item = "buzz" });
	if (i+1 / 3 == (i+1 / 3).round, { item = "fizz" });
	if (i+1 / 15 == (i+1 / 15).round, { item = "fizzbuzz" });
	i = item
})
)