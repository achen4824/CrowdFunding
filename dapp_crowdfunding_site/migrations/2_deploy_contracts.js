var storeData = artifacts.require("./storeData.sol");
var crowdFund = artifacts.require("./crowdfunding.sol");

module.exports = async function(deployer) {
  await deployer.deploy(storeData);
};