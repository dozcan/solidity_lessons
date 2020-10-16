1) memory dizileri new ile yaratılır
2) ama boyutu push ile artırılamaz
push sadece belirsiz boyutlu storage arraylerde çalışır
3) boyutu artırmanın tek yolu yeni bir array yaratıp for ile tek tek kopyalamaktır
4) memory dizilerinde ilk atama yoktur = > uint8 []memory s = [1,2,3];
bunun yerine tek tek atama yapabiliriz

 uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
