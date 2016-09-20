// allocate more memory for the server - granular synthesis can be quite taxing
s.options.memSize = 2.pow(21);

// boot up the server
s.boot

// buffer created containing left channel of an ambient texture sample
b = Buffer.readChannel(s, "/Users/rob/Supercollider/GranularSynthesis/drone_sample.wav", channels:[0]);

// define synth "drone" for endless ambience via granular synthesis
(
SynthDef(\drone, {
	var offsets, sig;

	offsets = Array.fill(
		size: 16,
		function: { arg i; i * 0.066 }
	).postln;

	sig = GrainBuf.ar(
		trigger: Dust.kr(density: 1!16),
		dur: LFNoise1.kr(freq: 0.1).range(lo: 2, hi: 4),
		sndbuf: b.bufnum,
		rate: Select.kr(
			which: LFNoise1.kr(1).range(0,2),
			array: [0.5, 1, 2]
		),
		pos: VarSaw.ar(
			freq: 1/b.duration,
			iphase: offsets,
			width: 0
		)
	);

	sig = Splay.ar( inArray: sig );

	Out.ar(
		bus: 0,
		channelsArray: sig
	)
}).add;
)

// create synth and generate endless ambient sound
Synth.new(\drone);