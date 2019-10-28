pragma solidity >=0.4.22 <0.6.0;

contract storeData {

    address[] public contractList;

    function createCrowdFund(address incontract) public returns (address){
        contractList.push(msg.sender);
        contractList.push(incontract);
    }
	function usergetList() public view returns(address[] memory){
		uint amount = 0;
		for(uint i = 0;i<contractList.length;i+= 2){
			if(contractList[i] == msg.sender){
				amount++;
			}
		}
		address[] memory theList = new address[](amount);
		uint index = 0;
		for(uint i = 0;i<contractList.length;i+=2){
			if(contractList[i] == msg.sender){
				theList[index] = contractList[i+1];
				index++;
			}
		}
		return theList;
		
	}
	function nonusergetList() public view returns(address[] memory){
		uint amount = 0;
		for(uint i = 0;i<contractList.length;i+= 2){
			if(contractList[i] != msg.sender){
				amount++;
			}
		}
		address[] memory theList = new address[](amount);
		uint index = 0;
		for(uint i = 0;i<contractList.length;i+=2){
			if(contractList[i] != msg.sender){
				theList[index] = contractList[i+1];
				index++;
			}
		}
		return theList;
	}
}