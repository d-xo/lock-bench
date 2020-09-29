pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./LockBenchmarks.sol";

contract LockBenchmarksTest is DSTest {
    LockBenchmarks benchmarks;

    function setUp() public {
        benchmarks = new LockBenchmarks();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
