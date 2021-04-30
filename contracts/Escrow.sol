pragma solidity >=0.4.22 <0.9.0;

contract Escrow {

    //transaction state
    enum State  {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETED}

    //buyer and seller address
    address buyer;
    address payable seller;
    State currentState;


    // modifiers
    modifier onlyBuyer() {require(msg.sender == buyer); _;}
    modifier inState(State expectedState) {require(expectedState == currentState); _;}

    constructor(address _buyer, address payable _seller) public {
        seller = _seller;
        buyer = _buyer;
        currentState = State.AWAITING_PAYMENT;
    }

    function makePayment() payable onlyBuyer inState(State.AWAITING_PAYMENT) public {
        currentState = State.AWAITING_DELIVERY;

    }

    function confirmDelivery() onlyBuyer inState(State.AWAITING_DELIVERY) public {
        
        seller.transfer(address(this).balance);
        currentState = State.COMPLETED;

    }

}