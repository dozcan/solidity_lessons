eğer state değiştirmiyorsak yani global değer manipule edilmiyorsa, view kullanılmalı


pragma solidity ^0.4.18;
contract SimpleStore {
    uint[2] a = [uint(1),2];
    function get() public view returns(uint){
        uint[2] memory b = [uint(3),3];
        b=a; 
        b[0]= 10;
        return a[0];
    }
}

ama burada view kullanamıyoruz 

pragma solidity ^0.4.18;
contract SimpleStore {
    uint[2] a = [uint(1),2];
    function get() public  returns(uint){
        uint[2] memory b = [uint(3),3];
        a=b; 
        b[0]= 10;
        return a[0];
    }
}
