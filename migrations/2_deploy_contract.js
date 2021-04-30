/**
Author: Pages Coffie
Date: April 30th, 2021
App: An Escrow Contract
*/
const Escrow = artifacts.require("./Escrow.sol");

module.exports = function (deployer) {
    deployer.deploy(Escrow, "0xC0AF6dA1A27fC18D475e70BF72fD82997427A810", "0x28a83D27B6aa4d7FDC096f45CAaaE6b2794fD128");
  };