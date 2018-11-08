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
