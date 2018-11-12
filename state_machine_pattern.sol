STATE MACHINE PATTERN

pragma solidity ˆ0.4.17;
contract DepositLock {
enum Stages {
    AcceptingDeposits,
      FreezingDeposits,
      ReleasingDeposits
  }
  Stages public stage = Stages.AcceptingDeposits;
  uint public creationTime = now;
  mapping (address => uint) balances;
  modifier atStage(Stages _stage) {
    require(stage == _stage);
    _;
  }
  modifier timedTransitions() {
    if (stage == Stages.AcceptingDeposits && now >=
      creationTime + 1 days)
    nextStage();
    if (stage == Stages.FreezingDeposits && now >=
      creationTime + 8 days)
    nextStage();
    _;
  }
  function nextStage() internal {
    stage = Stages(uint(stage) + 1);
  }
  function deposit() public payable timedTransitions
  atStage(Stages.AcceptingDeposits) {
    balances[msg.sender] += msg.value;
  }
  function withdraw() public timedTransitions atStage(
    Stages.ReleasingDeposits) {
    uint amount = balances[msg.sender];
    balances[msg.sender] = 0;
    msg.sender.transfer(amount);
  }


  Buradaki olay şudur:

Global bir state yaratılır ve işlemlerin akışın durumunu bu state içerisindeki geçişlere göre belirlenir.
Buradaki state içerisinde 3 tane durum mevcuttur
1 accepting deposit : para alımını kabul etme
2)Freezing deposti : para gönderimini kilitlemek(özellikle ico projelerinde kullanılır)
3)releasing deposit : para gönderimini serbest bırakmak

Stages public stage = Stages.AcceptingDeposits; ile sözleşmemizin başlangıç durumunu para kabul edebilir duruma çekiyoruz.
  uint public creationTime = now; sölezleşme yaratılırkenki tarih olarak ayarlıyoruz bunu sonra tarhi kontrollerinde kullanacağız


3 tane modifierımız var bunları açıklayalım

İlki atStage : bu state kontrolü yapacaktır ve input parametresi ile verilen durumda isek işleme devam etmemize izin verecektir
timedTransitions : burada yaptığımız kontroller şu şekildedir
para kabul edebilir durumda iken sözleşme yaratım üzerinden 1 günden fazla geçmiş ise artık bir sonraki duruma geçiyoruz  ki dondurma aşamasıdır ve artık bakiye kabul etmeyeceğiz emektir
para donruma aşamısında isek 8 gün süreyi tamamladıysak artık fonun serbest bırakılmasını sağlayabiliriz ki katılımcılar paralarını çekebilsinler

deposit medotu: yukarıdaki 2 modifier ı kullanır ve buna göre akışa karar verir:
  para gönderebilmemiz için hem süre ve hemde stat uygun olmaldıır

withdraw: para çekebilmemiz için : stta relasing duruda olmaldır
