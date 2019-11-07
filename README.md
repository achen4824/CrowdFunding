# CrowdFunding with Smart Contracts

The main part of the project is included in the "Generic" folder.
"ShareRegistration" contains a smart contract implementation of the share registration and voting system described in the paper  “Analysis and outlook of application of blockchain technology to equity crowdfunding in China,” [1] by Huasheng Zhu and Zach Zhizhong Zhou 
"dapp_crowdfunding_site" is a working distributed application for the deployment and funding of smart contracts it runs on NodeJS.

In the Generic Folder:
incentivized.cpp is used to model and test the price distribution function used in the contract.
OPCODEtoGAS.cpp uses opcodes and gas costs specified in opcodetogasreference.csv to sum total gas costs from solidity assembly code it is invoked with ./(binary file) "file" and outputs sum of all identifiable OPCODE gas costs

In Generic/Contracts:
The crowdfunding contracts created in solidity with their varying refund strategies.
They were tested in the online Remix IDE for Solidity. 

In Generic/Assembly:
The crowdfunding contracts assembly code split into varying parts depending on time complexity. 
These parts were then run through OPCODE to gas cost to find the cost of running that part.

Generic.xlsx
Contains the cost functions for each function within the contract as well as the functions for total gas cost of the contract. 


NOTE: Random Selection and First Come First Serve implementations are not in this repository however they will be added once they are found.