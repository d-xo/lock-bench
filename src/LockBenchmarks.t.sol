pragma solidity ^0.6.7;

import "ds-test/test.sol";

contract SingleStore {
    uint nonce = 0;
    modifier lock() {
       uint _nonce = nonce;
       nonce++;
       _;
       require(_nonce + 1 == nonce);
    }

    function f() lock public {}
}

contract DoubleStoreTFT {
    bool unlocked = true;
    modifier lock() {
      unlocked = false;
      _;
      unlocked = true;
    }

    function f() lock public {}
}

contract DoubleStoreFTF {
    bool locked = false;
    modifier lock() {
      locked = true;
      _;
      locked = false;
    }

    function f() lock public {}
}

contract LockBenchmarksTest is DSTest {
    SingleStore single;
    DoubleStoreFTF doubleFTF;
    DoubleStoreTFT doubleTFT;

    function setUp() public {
        single = new SingleStore();
        doubleFTF = new DoubleStoreFTF();
        doubleTFT = new DoubleStoreTFT();
    }

    function test_single() public {
        single.f();
    }

    function test_doubleFTF() public {
        doubleFTF.f();
    }

    function test_doubleTFT() public {
        doubleTFT.f();
    }
}
