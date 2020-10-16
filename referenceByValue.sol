pragma solidity >=0.2.0 <0.8.0;

import "./D.sol";


contract C {
    uint[20] x;

    function f() public {
        g(x);
        h(x);
    }

    function g(uint[20] memory y) public pure {
        y[2] = 3;
    }

    function h(uint[20] storage y) internal {
        y[3] = 4;
    }
    
    function get()public returns(uint[20]memory){
        return x;
    }
}
