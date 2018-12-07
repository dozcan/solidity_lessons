pragma solidity ^0.5.0;

library math {

  function add(uint a,uint b) public pure returns(uint c){
      c = a + b;
  }
}

contract calc {
    uint c;
    function calcAdd()public returns(uint){
         c = math.add(3,4);
         return c;
    }
}

=> burada gas tüketimi çok düşüyor

pragma solidity ^0.5.0;


contract math {

  function add(uint a,uint b) external pure returns(uint c){
      c = a + b;
  }
}


contract calc {
    uint c;
    function calcAdd()public returns(uint){
        math mathContract = new math();
         c = mathContract.add(3,4);
         return c;
    }

}
**************************************************************************


import "./SafeMath.sol";

contract ERC20 {

    using SafeMath for uint256;
    mapping(address => uint256) balances;

    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        return true;
    }
}

library SafeMath {

    function mul(uint256 a, uint256 b) external pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }


    function div(uint256 a, uint256 b) external pure returns (uint256) {
        uint256 c = a / b;
        return c;
    }


    function sub(uint256 a, uint256 b) external pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }


    function add(uint256 a, uint256 b) external pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}



