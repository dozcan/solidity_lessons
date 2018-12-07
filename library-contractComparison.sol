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


