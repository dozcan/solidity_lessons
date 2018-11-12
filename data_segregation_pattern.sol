DATA SEGREGATION PATTERN

Burada söleşmeleri object orietnted sınıf yapısındaki gib interface segregation mantığında işletiyoruz.
  Ayrıca dependecny injection patterni gibi seoeratişon of concern presibini işletiiyoruzç
Artı güncelleme gerektiğinde sa dece bir sözleşmemizde güncelleme gerekecektir ayrıca izole etmiş olmak
Bağımlılığı azaltmada önemli bir avantaj sağlayacaktır.

  Datastorage sözleşmemiz

pragma solidity ˆ0.4.17;
contract DataStorage {
  mapping(bytes32 => uint) uintStorage;
  function getUintValue(bytes32 key) public constant
  returns (uint) {
    return uintStorage[key];
  }
  function setUintValue(bytes32 key, uint value) public {
    uintStorage[key] = value;
  }
}


pragma solidity ˆ0.4.17;
import "./DataStorage.sol";
contract Logic {
  DataStorage dataStorage;
  function Logic(address _address) public {
    dataStorage = DataStorage(_address);
  }
  function f() public {
    bytes32 key = keccak256("emergency");
    dataStorage.setUintValue(key, 911);
    dataStorage.getUintValue(key);
  }
}
