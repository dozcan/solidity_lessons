pragma solidity ^0.4.18;

contract C {
    int8[] dynamicStorageArray;
    int8[5] fixedStorageArray;

    function f() {
        int8[] memory memArr;        // Case 1
        memArr.length++;             // illegal

        int8[5] storage storageArr = fixedStorageArray;   // Case 2
        storageArr.length++;                             // illegal

        int8[] storage storageArr2 = dynamicStorageArray;
        storageArr2.length++;                     // legal


    }
}
