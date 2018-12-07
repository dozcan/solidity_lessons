function twoOutputsExample(uint _input1, uint _input2) returns (uint s, uint p){
    sum = _input1 + _input2;
    product = _input1 * _input2;
    s = sum;
    p = product;
}

uint256 crowdsaleCap = 100 * 1 ether;
uint weiRaised;

modifier afterRaised(uint256 cap) {
    require(weiRaised >= cap);
    _;
}

function finalizeCrowdsale() afterRaised (crowdsaleCap) {
    // finalization logic
}
