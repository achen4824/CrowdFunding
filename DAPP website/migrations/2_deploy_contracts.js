var storeData = artifacts.require("./storeData.sol");
var crowdFund = artifacts.require("./crowdfunding.sol");

module.exports = function(deployer) {
  deployer.deploy(storeData);
};

module.exports = function(deployer) {
  deployer.deploy(crowdFund,3,"5000000000000000000","TestContract");
  storeData.deployed().then(function(instance){
    crowdFund.deployed().then(async function(instance2){
      instance.createCrowdFund(instance2.address);
    })

  })
};