Ethereum send ve gas pattern

Veri tansferi işlemini asla birkere de ve döngü içerisinde yamayın . PULL PAYMENT PATTERN kullanın
bunu iki sebebi vardır

function refundAll() public {
  for(uint x; x < refundAddresses.length; x++) { // arbitrary length iteration based on how many addresses participated
    require(refundAddresses[x].send(refunds[refundAddresses[x]])) // doubly bad, now a single failure on send will hold up all funds
  }
}


1)	İlki herhangi bir işlem hata alırsa diğer bakiyelerin adreslere teslimi mümkün olmaz sonrasında kodunuzu değiştirmek zorunda kalmanız muhafaza ettiğiniz bakiyerleriniz kaybolmasına sebebp olabilir
2)	Bildiiğniz üzere etherum üzernde blokların boyutları  gaslimit değeri ile ölçlülür, sizin akıllı sözleşmenizini tranaction gas değeri yüksek çıkarsa blok içerisinden çıkarılmak zorunda kalınır ve böylece ödemelerinizi yapamayabilirisiniz.

Eğer döngü sayısını bilemiyorsunuz bunun için harika bir kontrol sistemi var. Gas kontrol kodu ekleyin ve yarım kalan indis değerini saklayın gelir kalan gönderim işlemlieri bir sonraıi trasncation içerisinde yapın

function payOut() {
  uint256 i = nextPayeeIndex;
  while (i < payees.length && msg.gas > 200000) {
    payees[i].addr.send(payees[i].value);
    i++;
  }
  nextPayeeIndex = i;
}
