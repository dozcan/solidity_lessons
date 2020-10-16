pragma solidity >=0.2.0 <0.8.0;

contract compare {
    
    function _compare(string memory s1,string memory s2) public view returns (bool,address){
        address s = address(0);       
        return (keccak256(bytes(s1)) == keccak256(bytes(s2)),s);
        
    }
    
    function concate(string memory s1,string memory s2) public view returns(string memory){
     bytes memory _a = bytes(s1);
     bytes memory _b = bytes(s2);
     bytes memory ab = new bytes(_a.length + _b.length+1);
     uint k = 0;
     uint i = 0;
     for (i = 0; i < _a.length; i++) ab[k++] = _a[i];
     ab[k++] = 0x20;
     for (i = 0; i < _b.length; i++) ab[k++] = _b[i];
     return string(ab);
     
  
    }
}
