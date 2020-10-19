string to byte32 çevrimi yapan metod

pragma solidity >=0.2.0 <0.8.0;

contract compare {
   
  function stringToBytes32(string memory source) public pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
  }
}
