pragma experimental SMTChecker;

contract C
{
	mapping (uint => uint) map;
	function f(uint x, uint p) public {
		require(x < 100);
		map[p] = 100;
		map[p] += map[p] + x;
		assert(map[p] < 300);
		assert(map[p] < 110);
	}
}
// ----
// Warning 6328: (198-218): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\np = 0\n\n\nTransaction trace:\nconstructor()\nf(0, 0)
