(
SynthDef(\blip, {
	arg lo=40, hi=76, amp=1;
	var
	sig = LFTri.ar(LFPulse.kr(LFTri.ar(1!2).range(400,5000)).range(lo.midicps,hi.midicps) / 2),
	sig2 = LFTri.ar(LFPulse.kr(LFNoise1.ar(5!2).range(35,40)).range(lo.midicps,hi.midicps) / 4);

	sig = sig * 0.1 * EnvGen.kr(Env.perc(releaseTime: 0.2), doneAction:2);
	sig2 = sig2 * 0.1 * EnvGen.kr(Env.perc(releaseTime: 0.5), doneAction:2);
	sig = Mix.ar([sig, sig2]) * amp;
	Out.ar([0, 16, 17], sig);
}).add;

SynthDef(\noise, {
	arg lo=30, hi=11200, lo2=440, hi2=6000, amp=1;
	var sig = LFTri.ar(LFPulse.kr(PinkNoise.ar(1!2).range(40,400)).range(lo, hi)),
	    sig2 = LFTri.ar(LFPulse.kr(LFNoise1.ar(100!2).range(20,20)).range(lo2, hi2));
	sig = sig * 0.1 * EnvGen.kr(Env.perc(releaseTime: 0.2), doneAction:2);
	sig2 = sig2 * 0.1 * EnvGen.kr(Env.perc(releaseTime: 0.5), doneAction:2);
	sig = Mix.ar([sig, sig2]) * amp;
	Out.ar(0, sig);
}).add;
)

Synth.new(\noise);

(
~notes = [40, 42, 42, 45, 52, 45, 37]+36;
~freqs = 110 * [4, 2, 10, 4, 7, 5, 4, 10, 2, 4];
~freqz = ~freqs + 550;

~blip_pattern = Pbind(
	\instrument, \blip,
	\lo, Pseq(~notes, inf),
	\hi, Pseq(~notes+36, inf),
	\amp, 0.4,
	\dur, Pwrand([2, 1, 0.5, 0.25], [0.2, 0.3, 0.4, 0.1], inf)
);

~noise_pattern = Pbind(
	\instrument, \noise,
	\lo, Pseq(~notes, inf),
	\hi, Pseq((~notes + 36), inf),
	\lo2, Pseq(~freqs, inf),
	\hi2, Pseq(~freqz, inf),
	\amp, 0.25,
	\dur, Pwrand([0.5, 0.25, 0.125] , [0.3, 0.3, 0.4], inf)
);
)

~blips = ~blip_pattern.play(quant: 0.5);
~noises = ~noise_pattern.play(quant: 0.5);
~blips.stop;
~noises.stop;