pragma solidity ^0.5.0;

import "./MultiContractFile.sol";

contract VariableCosts {
  MultiContractFileA multi;

  constructor() public {
    multi = new MultiContractFileA();
  }

  function otherContractMethod() public {
    multi.hello(); // 20,000 gas (sets uint to 5 from zero)
    multi.hello(); //  5,000 gas (sets existing storage)
    multi.hello(); //  5,000 gas (sets existing storage)
  }
}
