1) memory dizileri new ile yaratılır
2) ama boyutu push ile artırılamaz
push sadece belirsiz boyutlu storage arraylerde çalışır
3) boyutu artırmanın tek yolu yeni bir array yaratıp for ile tek tek kopyalamaktır
4) memory dizilerinde ilk atama yoktur = > uint8 []memory s = [1,2,3];
bunun yerine tek tek atama yapabiliriz


global array initilaize edilir
ama locak array initlazie edilmez
 function arr() public  returns (uint256) {
      
    uint256 [] memory sayi2 =  [1,2,3,4,6]; not ok
    
    sayi = [1,2,3,4,6]; ok
      
  }


 uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        
//////////////////////////////

sabit boyutlu coklu dizi
pragma solidity >=0.1.16 <0.8.0;
pragma experimental ABIEncoderV2;
contract sabitboyutlu{
    uint[][2] crypto_names;
    
    function set()public{
        crypto_names[0] = [1,2,3]  ; // generic characters

    }
    
    function get() public returns (uint[][2] memory ){
        return crypto_names;
    }
}

///////////////////////////////
dinamik boyutlu coklu dizi

pragma solidity >=0.1.16 <0.8.0;
pragma experimental ABIEncoderV2;
contract dinamikboyutlu{
     string[2][] public crypto_names;
 
    constructor() public {
        crypto_names.push(["Alice", "Bob"]);   // generic characters
        crypto_names.push(["Carol", "Dave"]);  // 3rd and 4th party
        crypto_names.push(["Eve", "Frank"]);   // Bad guys
        crypto_names.push(["Grace", "Heidi"]); // others
    }
    
    function get() public returns (string[2][] memory ){
        return crypto_names;
    }
}

//////////////////////////////////////
pragma solidity >=0.2.0 <0.8.0;

contract compare {
    
    uint[2**20] m_aLotOfIntegers;
    uint[2][2] m_pairsOfFlags;
    uint[] ss;

 
    function set(uint value) public returns (uint[2][2] memory){
        m_pairsOfFlags[0][0]= value;
        m_pairsOfFlags[0][1]= value;
        m_pairsOfFlags[1][0]= value+1;
        m_pairsOfFlags[1][1]= value+1;
        return m_pairsOfFlags;
    }
  
    
    function manipulate()public returns (uint){
    uint sum;
     for(uint i=0;i<m_pairsOfFlags.length;i++){
         uint inner = m_pairsOfFlags[i].length;
          for(uint j=0;j<inner;j++){
              sum = sum + m_pairsOfFlags[i][j];
          }
     }   
     return sum;
    }
}

        
