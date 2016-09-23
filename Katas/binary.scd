(
~binary = {
	|n|
	var width = 0;
	var num = n;
	while ({ num / 2 >= 1 }, { width = width + 1; num = num / 2 });
	n = n.asBinaryString(width + 1);
};
)

~binary.value(0);
~binary.value(2);
~binary.value(4);
~binary.value(511);
~binary.value(512);
~binary.value(1023);
~binary.value(1024);
