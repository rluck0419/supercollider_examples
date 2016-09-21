// This synth is a generic reverb synth, to be used with input from other synths
// When creating other synths, use something like:

// Out.ar([out, 16, 17], sig);

// This output ugen will send the audio to the specified output bus (out) as well as buses 16 and 17.
// 16 and 17 are then treated with the reverb and attenuated as specified by the amplitude.
// By doing so, this format essentially emulates an effects bus track.

(
SynthDef(\reverb, {
	arg i1=16, i2=17, out=0, amp=0.2, gate=1;
	var sig, env;
	sig = In.ar([i1,i2], 2);
	env = EnvGen.kr(Env.new([0,1,0],[5,5],[1,1],1),gate,doneAction:2);
	sig = GVerb.ar(sig, 50, 5, drylevel:0) * amp * env;
	Out.ar(out, sig);
}).add;
)

Synth.new(\reverb);