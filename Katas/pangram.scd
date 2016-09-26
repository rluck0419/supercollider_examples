(
~is_pangram = {
	|s|
	var is_pangram = true, non_alphas = 0, alpha, sarray = [];
	alpha = Array.fill(26, { arg i; "abcdefghijklmnopqrstuvwxyz"[i] });
	alpha.do({
		arg item, i;
		if (s.containsi(item.asString) == false, { is_pangram = false });
	});
	is_pangram
}
)

~is_pangram.value("");
~is_pangram.value("d");
~is_pangram.value("a quick movement of the enemy will jeopardize five gunboats");
~is_pangram.value("the quick brown fox jumps over the lazy dog");
~is_pangram.value("abcdefghijklmnopqrstuvwxyz");
~is_pangram.value("the_quick_brown_fox_jumps_over_the_lazy_dog");
~is_pangram.value("the 1 quick brown fox jumps over the 2 lazy dogs");
~is_pangram.value("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog");
~is_pangram.value("Five quacking Zephyrs jolt my wax bed.");
~is_pangram.value("Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.");