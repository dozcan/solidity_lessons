REFERANS VE VALUE TYPE ATAMALARI

1) value degerler ister, storage ister memory olsun birbirine atanırken yeni bir copy değişken oluşturulduğu için birine yapılan
değişiklik diğerini etkilemez

2) iki storage referans değeri arasındaki atamalarda yeni bir copy referans değer oluşturulduğu için birine yapılan değişiklik diğerini
etkilemez

3) bir storage referans ile bir memry referans değeri arasındaki atamalarda yeni bir copy referans değer oluşturulduğu için birine yapılan değişiklik diğerini
etkilemez

4) iki memory referans değerleri arasındaki atamalarda yeni bir copy işlemi olmadığı için birine yapılan değişiklik diğerine yansır


***** sonuç olarak iki memory referans arasında yeni bir copy değişken oluşturulmaz


pragma solidity ^0.4.0;

contract C {
    uint someVariable;
    uint[] data;

    function f() public {
        uint[] x;
        x.push(2);
        data = x;
    }
}


pragma solidity ^0.4.0;

contract C {
    uint someVariable;
    uint[] data;

    function f() public {
        uint[] x = data;
        x.push(2);
    }
}
