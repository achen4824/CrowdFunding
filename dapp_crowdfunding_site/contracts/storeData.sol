pragma solidity >=0.4.22 <0.6.0;

contract storeData {

    address[] public contractList;

    function createCrowdFund(address incontract) public returns (address){
        contractList.push(msg.sender);
        contractList.push(incontract);
    }
	function returnList() public view returns (address[] memory){
		return contractList;
	}
	function completeFunding(address icontract) public {
		uint i = 0;
		bool hit = false;
		for(i=0;i<contractList.length;i++){
			if(icontract == contractList[i]){
				hit = true;
				break;
			}
		}
		if(hit){
			delete contractList[i];
			delete contractList[i-1];
			if(i != contractList.length-1){
				contractList[i] = contractList[contractList.length-1];
				contractList[i-1] = contractList[contractList.length-2];
			}
			contractList.length -= 2;
		}
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