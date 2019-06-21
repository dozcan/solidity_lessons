   1) array tanımlama = 5 elemanlı bir dizi döndürür ve her biri 0 dır
      int[] doga = new int[](5);
    
   2) bytes tanımlayalım => dinamik byte array
   
     a) bytes ad = "doga ozcan"
     
pragma solidity ^0.4.18;
contract SimpleStore {

    bytes localBytes = new bytes(5);
    function get() public view  returns(bytes1){
       bytes1 a;
       for(uint i =0;i<localBytes.length;i++){
             a= localBytes[i];
       }
      return a;
    }
}

3) byte[] bytes31 den oluşan bir array ama tavsiye edilmiyor zira her elemanı bytes31 olarak tutuyor bu da boşuna alan tutmak demektir.

pragma solidity ^0.4.18;
contract SimpleStore {

    bytes localBytes = "doga";
    function get() public view  returns(bytes1[]){
       bytes1[] memory a = new bytes1[](localBytes.length);
       for(uint i =0;i<localBytes.length;i++){
             a[i] = localBytes[i];
       }
      return a;
    }
}

4) string array üzerinde indeksleme yapılmaz ve lenght özelliği yoktur illa yapmak istersek bytes a çevirmek gerekir
//Write your own contracts here. Currently compiles using solc v0.4.15+commit.bbb8e64f.
pragma solidity ^0.4.18;
contract SimpleStore {

    string localBytes = "doga";
    function get() public view returns(bytes){
      bytes memory doga = bytes(localBytes);
      return doga;
      
    }
}
