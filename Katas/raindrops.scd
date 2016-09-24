(
~raindrops = {
	|n|
	var string ='', output = n;
	if (n % 3 == 0, { string = 'Pling' });
	if (n % 5 == 0, { string = 'Plang' });
	if (n % 7 == 0, { string = 'Plong' });
	if (n % 15 == 0, { string = 'PlingPlang' });
	if (n % 21 == 0, { string = 'PlingPlong' });
	if (n % 35 == 0, { string = 'PlangPlong' });
	if (n % 105 == 0, { string = 'PlingPlangPlong' });
	if (string != '', { output = string });
	output
}
)

~raindrops.value(2);
~raindrops.value(3);
~raindrops.value(5);
~raindrops.value(7);
~raindrops.value(15);
~raindrops.value(21);
~raindrops.value(35);
~raindrops.value(105);