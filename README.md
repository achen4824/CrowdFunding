# Crowdfunding with Smart Contracts

This is a project undertaken in **COMP SCI 2008** - *Topics in Computer Science* at University of Adelaide. 

Blockchain technology has the security to manages financial transfers with great speeds ensuring the funds security through decentralization and lots of math. Smart Contracts are self executing contracts that according to preconcieved programs can hold/send funds much like a normal contract. But because these smart contracts are withheld on the blockchain they are tamperproof and irreversible making them unable to be changed. However computation on the blockchain is not free and users pay a transactional fee based on computation **not** size of funds.

This project was to determine at amount of people during crowdfunding would the *waste* in transactional fees outweigh the funds raised for different strategies

## Why Crowdfunding?

Crowdfunding often create large pools of financial capital which is withheld often withheld by a single entity. By using a smart contract to take the place of the single entity participants can trust that the funds will reach the contract creator. Additional benefit of smart contracts is that promises *("we will sell 1000 copies by July")* made during the creation of the contract can be enforced and as such can incur financial punishment if not fufilled.

<p align="center">
  <img  src="/Picture1.jpg" data-canonical-src="/Picture1.jpg" width="400"/>
</p>

## This Repository

### Generic Folder

#### Files

**incentivized.cpp** is used to model and test the price distribution function used in the contract.
**OPCODEtoGAS.cpp** uses opcodes and gas costs specified in opcodetogasreference.csv to sum total gas costs from solidity assembly code it is invoked with ./(binary file) "file" and outputs sum of all identifiable OPCODE gas costs

#### Folders

**Generic/Contracts:** The crowdfunding contracts created in solidity with their varying refund strategies. Equal distribution of funding goal, incentivized distribution of funding goal, and lottery refund. They were tested in the online Remix IDE for Solidity. 

**Generic/Assembly:** The crowdfunding contracts assembly code split into varying parts depending on time complexity. These parts were then run through OPCODE to gas cost to find the cost of running that part.

**Generic.xlsx:** Contains the cost functions for each function within the contract as well as the functions for total gas cost of the contract. 

Solidity Code | OPCode | Gas Cost
-------------- | -------- | -----------
variable = 2 | PUSH 0 | 3
&nbsp; | PUSH 1 | 3
&nbsp; |DUP 2 | 3
&nbsp; |SWAP 1| 3
&nbsp; |SSTORE | 20000
&nbsp; |POP | 2

### Distributed Application (DAPP) Website
**dapp_crowdfunding_site:**  is a working distributed application for the deployment and funding of smart contracts it runs on NodeJS and utilizes the Web3 framework to interact with an Ethereum network thorugh the extension [MetaMask](https://github.com/MetaMask). This website was created as a proof of concept and served as a demonstration during a University Convention, although it didn't get any attention the Professor thought it was neat. 

### Share Registration Contract
**ShareRegistration** contains a smart contract implementation of the share registration and voting system described in the paper  “[Analysis and outlook of application of blockchain technology to equity crowdfunding in China](https://jfin-swufe.springeropen.com/articles/10.1186/s40854-016-0044-7),” [1] by Huasheng Zhu and Zach Zhizhong Zhou. 

This contract is different in that it uses a weighted democratic process based on ownership of the shares to determine a proposal. A minimum amount of votes/participation is needed to start a proposal as well as a majority vote. All shareholders can create proposal in the form of a smart contract. When a proposal goes through, using the defer functionality the proposal functionality will be executed within the existing smart contracts allowing for modification of its funds/data/properties. 

**NOTE:** Random Selection and First Come First Serve implementations are not in this repository however they will be added once they are found.
