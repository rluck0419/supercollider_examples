// This synth is a generic reverb synth, to be used with input from other synths
// When creating other synths, use something like:

// Out.ar([out, 16, 17], [sig, sig * 0.5, sig * 0.5]);

// ^This output ugen sends a dry audio signal to bus "out" - for local speakers: out=0
// 16 and 17 are then treated with the reverb and attenuated as specified by the amplitude.
// By doing so, you can balance the dry/wet ratio via the two independent amplitudes

(
SynthDef(\reverb, {
	arg i1=16, i2=17, out=0, size=30, dur=3, amp=0.05, gate=1;
	var sig, env;
	sig = In.ar([i1,i2], 2);
	env = EnvGen.kr(Env.new([0,1,0],[5,5],[1,1],1),gate,doneAction:2);
	sig = GVerb.ar(sig, size, dur, drylevel:0) * amp * env;
	Out.ar(out, sig);
}).add;
)

~reverb = Synth.new(\reverb);
~reverb.set(\dur, 6);
~reverb.set(\amp, 0.2);
~reverb.free;