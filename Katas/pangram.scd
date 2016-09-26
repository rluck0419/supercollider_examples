(
~is_pangram = {
	|s|
	var string = s, is_pangram = true, alpha = Array.fill(26, { arg i; "abcdefghijklmnopqrstuvwxyz"[i] });
	if (!string.containsi("a"), { is_pangram = false });
	if (!string.containsi("b"), { is_pangram = false });
	if (!string.containsi("c"), { is_pangram = false });
	if (!string.containsi("d"), { is_pangram = false });
	if (!string.containsi("e"), { is_pangram = false });
	if (!string.containsi("f"), { is_pangram = false });
	if (!string.containsi("g"), { is_pangram = false });
	if (!string.containsi("h"), { is_pangram = false });
	if (!string.containsi("i"), { is_pangram = false });
	if (!string.containsi("j"), { is_pangram = false });
	if (!string.containsi("k"), { is_pangram = false });
	if (!string.containsi("l"), { is_pangram = false });
	if (!string.containsi("m"), { is_pangram = false });
	if (!string.containsi("n"), { is_pangram = false });
	if (!string.containsi("o"), { is_pangram = false });
	if (!string.containsi("p"), { is_pangram = false });
	if (!string.containsi("q"), { is_pangram = false });
	if (!string.containsi("r"), { is_pangram = false });
	if (!string.containsi("s"), { is_pangram = false });
	if (!string.containsi("t"), { is_pangram = false });
	if (!string.containsi("u"), { is_pangram = false });
	if (!string.containsi("v"), { is_pangram = false });
	if (!string.containsi("w"), { is_pangram = false });
	if (!string.containsi("x"), { is_pangram = false });
	if (!string.containsi("y"), { is_pangram = false });
	if (!string.containsi("z"), { is_pangram = false });
	is_pangram
}
)

~is_pangram.value("");
~is_pangram.value("the quick brown fox jumps over the lazy dog");
~is_pangram.value("abcdefghijklmnopqrstuvwxyz");