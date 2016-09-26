(
~is_pangram = {
	arg string = "", is_pangram = false, alpha = Array.fill(26, { arg i; "abcdefghijklmnopqrstuvwxyz"[i] });
	alpha.do {
		arg letter, index;
		if (string.containsi(letter), { is_pangram = true });
	};
	is_pangram
}
)

~is_pangram.value("");