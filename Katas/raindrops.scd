Server.killAll;
s.options.memSize = 2.pow(21);
(
SynthDef(\raindrops, {
	arg three=0, five=0, seven=0, lo=50, hi=86;
	var sig, array;
	array = Array.rand(20, (12*3**three) - (three * 3), 74 + (five * 5) + (seven * 7));
	sig = Klang.ar(`[ array.midicps, nil, nil ], 1, 0);
	sig = sig!2 * EnvGen.kr(Env.perc, doneAction:2) * 0.05;
	Out.ar(0, sig);
}).add;
)

(
~raindrops = {
	|n|
	var three=0, five=0, seven=0, output = n;
	if (n % 3 == 0, { three = 1 });
	if (n % 5 == 0, { five = 1 });
	if (n % 7 == 0, { seven = 1 });
	if (three + five + seven > 0, { Synth.new(\raindrops, [\three, three, \five, five, \seven, seven]) });
	output;
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

(
fork{
	{ PinkNoise.ar(0.1) * LFNoise2.kr(LFNoise1.kr(1!2).range(0.1,2)).range(0.1,0.4) }.play;
	inf.do{
		~raindrops.value(rrand(3,4200)).postln;
		rrand(0.02,0.4).wait;
	}
}
)