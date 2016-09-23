(
~binary = {
	|n|
	var num = n.asInt, width = 0, output = 'invalid argument';
	if (n.asInt.asString == n.asString, {
		while ({ num / 2 >= 1 }, { width = width + 1; num = num / 2 });
		output = n.asInt.asBinaryString(width + 1)
	});
	output
}
)

(
~binary.value(0).postln;
~binary.value(1).postln;
~binary.value(2).postln;
~binary.value(4).postln;
~binary.value(511).postln;
~binary.value(512).postln;
~binary.value(1023).postln;
~binary.value(1024).postln;
~binary.value(1024.5).postln;
~binary.value('a').postln;
~binary.value('10')
)