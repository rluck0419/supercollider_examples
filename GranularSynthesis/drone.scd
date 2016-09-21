// allocate more memory for the server - granular synthesis can be quite taxing
s.options.memSize = 2.pow(21);

// boot up the server
s.boot

// buffer created containing left channel of an ambient texture sample
b = Buffer.readChannel(s, "/Users/rob/Supercollider/GranularSynthesis/drone_sample.wav", channels:[0]);

// define synth "drone" for endless ambience via granular synthesis
(
SynthDef(\drone, {
	arg gate=1, amp=0.5;
	var trigger, dur, selector, rate, offset, pos, sig;
	trigger = Dust.kr(1!16);
	dur = LFNoise1.kr(0.1!16).range(2, 4);
	selector = LFNoise1.kr(1!16).range(0, 2);
	rate = Select.kr(selector, [0.5, 1, 2]);
	offset = Array.fill(16, { arg i; i * 0.066 }).scramble;
	pos = VarSaw.ar(1/b.duration, offset, 0);

	sig = GrainBuf.ar(1, trigger, dur, b.bufnum, rate, pos);
	sig = Splay.ar(sig);
	sig = sig * amp;
	Out.ar(0, sig)
}).add;
)

// create synth and generate endless ambient sound
~drone = Synth.new(\drone);
~drone.set(\amp, 0.2);
~drone.free;