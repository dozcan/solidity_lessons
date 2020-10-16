// dinamik boyutlu dizi bytes 

pragma solidity ^0.6.0;

contract deneme {
    
    bytes name;
    
    function set(bytes memory x) public {
        name = x;
    } 
    
    function get()public view returns(bytes memory){
        return name;
    }
    
}

///////////////////////////////////////////////////
dinamik boyutlu diziye eleman atama dondurme

pragma solidity ^0.6.0;

contract deneme {
    
    bytes2[] name;
    
    function set(bytes2 x) public {
        name.push(x);
    }

    function get()public view returns(bytes2[] memory){
        return name;
    }
}

//sabit boyutlu dizi oluşturma
pragma solidity ^0.6.0;

import "./lib.sol";

contract deneme {
    using libdoga for *;

    function pyramid(uint l) public pure returns (uint) {
        return libdoga.range(l).map(square).reduce(sum);
    }

    function square(uint x) internal pure returns (uint) {
        return x * x;
    }

    function sum(uint x, uint y) internal pure returns (uint) {
        return x + y;
    }
}

vew kütüphanesi

pragma solidity ^0.6.0;

library libdoga {
    // internal functions can be used in internal library functions because
    // they will be part of the same code context
    function map(uint[] memory self, function (uint) pure returns (uint) f)
        internal
        pure
        returns (uint[] memory r)
    {
        r = new uint[](self.length);
        for (uint i = 0; i < self.length; i++) {
            r[i] = f(self[i]);
        }
    }

    function reduce(
        uint[] memory self,
        function (uint, uint) pure returns (uint) f
    )
        internal
        pure
        returns (uint r)
    {
        r = self[0];
        for (uint i = 1; i < self.length; i++) {
            r = f(r, self[i]);
        }
    }

    function range(uint length) internal pure returns (uint[] memory r) {
        r = new uint[](length);
        for (uint i = 0; i < r.length; i++) {
            r[i] = i;
        }
    }
}

/************************************************************************///
belli bir adresi belli akıllı sozleşmeyi kullanabilmek için aşağıdaki satır geçerlidir.
Oracle constant private ORACLE_CONST = Oracle(0x1234567); // known contract

//storage memory
1) referens tipler için tanımlandıkları yerlerde storage ve memory belirtici kullanılmalıdır
2) memory den memory donusumler mut able objeler oluşturur.
3) storage den memory ye dönüşüm immutable obje oluşturur.(object.assign())





