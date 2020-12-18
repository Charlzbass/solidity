pragma experimental SMTChecker;

contract C
{
	function f(uint x) public pure {
		require(x < 100);
		for(uint i = 0; i < 10; ++i) {
			// Overflows due to resetting x.
			x = x + 1;
		}
		assert(x < 14);
	}
}
// ====
// SMTSolvers: z3
// ----
// Warning 6328: (189-203): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 14\n\n\nTransaction trace:\nconstructor()\nf(4)
