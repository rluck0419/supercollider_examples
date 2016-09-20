// allocate more memory for the server - granular synthesis can be quite taxing
s.options.memSize = 2.pow(21);

// boot up the server
s.boot

// buffer created containing left channel of a waterfall sample
b = Buffer.readChannel(s, "/Users/rob/Supercollider/GranularSynthesis/Waterfall.aiff", channels:[0]);

(
// define synth with the name "drone"
SynthDef(\drone, {

	// initialization of two variables
	var offsets, sig;

	// initialize array for each channel's initial phase offset (16 total)
	offsets = Array.fill(
		size: 16,
		function: { arg i; i * 0.066 }
	).postln;

	// granular synthesis with:
	sig = GrainBuf.ar(

		// random trigger rate (average 1 per second),
		trigger: Dust.kr(density: 1!16),

		// random duration of grains (rather long - 2-4 seconds)
		dur: LFNoise1.kr(freq: 0.1).range(lo: 2, hi: 4),

		// bufnum from buffer (b) above
		sndbuf: b.bufnum,

		// random rate
		rate: LFNoise2.kr(freq: 0.1!16).range(lo: 0.8, hi: 1.2),

		// sawtooth oscillator moves through buffer linearly (and loops around to beginning):
		pos: VarSaw.ar(
			// runs through for the duration of the buffer (b)
			freq: 1/b.duration,

			// initial phase for each channel (array of 16 offset values)
			iphase: offsets,

			// variable duty of sawtooth creates a linear (0 to 1) shape before jumping back to 0
			width: 0
		);
	);

	// mix down to stereo by spreading each channel evenly across the stereo spread
	sig = Splay.ar( inArray: sig );

	// send out the signal to the local sound device
	Out.ar(
		bus: 0,
		channelsArray: sig
	);
}).add;
)

// create synth (produce sound!)
Synth.new(\drone);