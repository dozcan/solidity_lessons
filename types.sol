uint8 => 1 byte değer tutar

böyle olunca, 0 ile - 256 arasındaki tam sayıları tutabilir

int8 ise -127 ile 127 arasındaki sayıları tutabilir

***********************************************************
hex den int dönüşümü

hex sayı = 0x0A şeklinde ifade edilir

0000 1010 şeklinde yazılır

ve => 10 yapar

pragma solidity ^0.4.18;
contract SimpleStore {
    bytes1 doga = 0x0a;
    function get() public view returns(uint){
        return uint(doga);
    }
}



