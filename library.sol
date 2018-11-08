//Write your own contracts here. Currently compiles using solc v0.4.15+commit.bbb8e64f.
pragma solidity ^0.4.18;

import './Set.sol';
import './D.sol';

contract  C {
    
    Set.Data concreteData;
    function insert(uint value) public returns (bool){
        return Set.insert(concreteData,value);
    }
     function remove(uint value) public returns (bool){
        return Set.insert(concreteData,value);
    }
    function contains(uint value) public view returns (bool){
        return Set.contains(concreteData,value);
    }
    function get()public view returns (address,address){
        D newDContract = new D();
        return (newDContract.get(),address(this));
    }
}

library Set{
    
    struct Data {
        mapping(uint => bool) flags;
    }
    
    function insert(Data storage self,uint value) public returns(bool){
        if(self.flags[value])
            return false;  
        self.flags[value] = true;
    }
    
    function remove(Data storage self,uint value) public returns (bool){
        if(!self.flags[value])
            return false;
        self.flags[value] = false;
        return true;    
    }
    
    function contains(Data storage self, uint value) public view returns (bool){
        return self.flags[value];
    }
}

contract D {
    function get() public view returns(address){
        return this;
    }
}
