(
~binary = {
	|n|
	var num = n.asInt, width = 0, output = 'invalid argument';
	if (n.asInt.asString == n.asString, {
		while ({ num / 2 >= 1 }, { width = width + 1; num = num / 2 });
		output = n.asInt.asBinaryString(width + 1);
	});
	output
};
)

~binary.value(0);
~binary.value(2);
~binary.value(4);
~binary.value(511);
~binary.value(512);
~binary.value(1023);
~binary.value(1024);
~binary.value(1024.5);
~binary.value('a');
~binary.value('10');