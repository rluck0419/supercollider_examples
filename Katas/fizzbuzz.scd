(
~fb_array = Array.fill(100, {
	arg i, item=i+1;
	if (i+1 / 5 == (i+1 / 5).round, { item = "buzz" });
	if (i+1 / 3 == (i+1 / 3).round, { item = "fizz" });
	if (i+1 / 15 == (i+1 / 15).round, { item = "fizzbuzz" });
	i = item
})
)

(
~fizzbuzz = {
	|n|
	var output = n;
	if (n / 3 == (n / 3).round, { output = "fizz" });
	if (n / 5 == (n / 5).round, { output = "buzz" });
	if (n / 15 == (n / 15).round, { output = "fizzbuzz" });
	output;
};
)

~fizzbuzz.value(1);
~fizzbuzz.value(33);
~fizzbuzz.value(25);
~fizzbuzz.value(45);
