pragma solidity >=0.4.22 <0.6.0;

contract startanddeploy {

    struct crowdfundlist {
        address owner;
        address crowdfundContract;
    }
    crowdfundlist[] public contractList;

    function createCrowdFund(uint daysCompletion,uint goalinWei, string memory idescription) public returns (address){
        address newContract = address(new crowdfunding(daysCompletion,goalinWei,idescription));
        contractList.push(crowdfundlist(msg.sender,newContract));
        return newContract;
    }
}

contract crowdfunding{
    
    //Funder Struct
    struct funder {
        uint fund;
        uint position;
    }
    
    //Variables
    uint finishTime;
    int goal;
    uint[] values;
    address payable owner;
    string description;
    address[] funderList;
    address payable[] allFunders;
    mapping(address => funder) addressToValue;
    mapping(uint => int) indexes;
    
    //Constructor
    constructor(uint daysCompletion, uint goalinWei,string memory idescription) public {
        require(goalinWei != 0,"Need goal to be more than zero");
        owner = msg.sender;
        goal = int(goalinWei);
        finishTime = now + (24 * 60 * 60 * daysCompletion);
        description = idescription;
        values.push(goalinWei/(100));
        indexes[goalinWei/(100)] = -1;  
        values.push(goalinWei/(50));
        indexes[goalinWei/(50)] = -1;  
        values.push(goalinWei/(20));
        indexes[goalinWei/(20)] = -1;  
        values.push(goalinWei/(10));
        indexes[goalinWei/(10)] = -1;  
        values.push(goalinWei/(5));
        indexes[goalinWei/(5)] = -1;  

    }
    function hasFund()public view returns (bool){
        if(addressToValue[msg.sender].fund == 0){
            return false;
        }else{
            return true;
        }
    }
    function getTime() public view returns(uint){
        return finishTime;
    }
    function getDescription() public view returns (string memory){
        return description;
    }
    //Check allowed values
    function getValues() public view returns (uint[] memory){
        return values;
    }
    
    //fund
    function fund() external payable{
        
        //Validate funding
        require(now < finishTime,"Funding period is over");
        require(msg.value > 0,"There is no bid value");
        require(indexes[msg.value] != 0,"Invalid fund amount only these are allowed check getValues()");
        
        if(addressToValue[msg.sender].fund == 0){
            allFunders.push(msg.sender);
            if(indexes[msg.value] == -1){
                indexes[msg.value] = 0;
            }
            indexes[msg.value]++;
            addressToValue[msg.sender].fund = msg.value;
        }else{
            //option to add more money
            revert("Currently no option to revert money");
        }
        
    }
    
    //function test(int a)public returns (int){
    //    return (-300*((a*a*a)-3*a*16))/(6*4**3);
    //}
    
    //End crowdfunding callable by anyone to resign control from the creator
    function finishFunding() public {
        
        
        require(now > finishTime, "Funding period is not done.");
        int finalValue;
        int price;
        uint trueLength = allFunders.length;
        
        for(uint i = 0;i<values.length;i++){
            if(indexes[values[i]]*int(values[i]) > goal){
                finalValue = int(values[i]); 
                break;
            }
        }
        if(finalValue == 0){
            //refund if goal is not possible
            for(uint a = 0; a<allFunders.length;a++){
                allFunders[a].transfer(addressToValue[allFunders[a]].fund);
            }
            return;
            //revert("Funding goal couldn't be achieved refunded all funders");
        //refund those users who didn't make threshold
        }else if(finalValue != int(values[0])){
            for(uint a = 0; a<allFunders.length;a++){
                if(addressToValue[allFunders[a]].fund < uint(finalValue)){
                    allFunders[a].transfer(addressToValue[allFunders[a]].fund);
                    delete addressToValue[allFunders[a]];
                    delete allFunders[a];
                    trueLength--;
                }
            }
            
            price = (goal /int(trueLength))+1;
        }
        //uint[] memory listOfRefunds = new uint[](trueLength); //moving values to memory
        uint iter = 0;
       while (trueLength > 0){
           if(allFunders[iter] != address(0)){
               allFunders[iter].transfer(addressToValue[allFunders[iter]].fund - uint(price));
               funderList.push(allFunders[iter]);
               trueLength--;
           }
           iter++;
       }

        owner.transfer(address(this).balance);
        
        delete values;
        delete goal;
        delete finishTime;
    }
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    function getGoal() public view returns (uint){
        return uint(goal);
    }
    function getFunderList() public view returns (address[] memory){
        return funderList;
    }
}
