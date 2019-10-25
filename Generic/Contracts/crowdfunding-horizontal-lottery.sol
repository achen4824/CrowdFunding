pragma solidity >=0.4.22 <0.6.0;

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
    address owner;
    address[] funderList;
    address payable[] allFunders;
    mapping(address => funder) addressToValue;
    mapping(uint => int) indexes;
    
    //Constructor
    constructor(uint daysCompletion, int goalinWei, uint[] memory insertValues) public {
        require(goalinWei != 0,"Need goal to be more than zero");
        require(insertValues.length != 0, "Need values");
        owner = msg.sender;
        goal = goalinWei;
        finishTime = now + (/*24 * 60 * 60 */ daysCompletion);
        for(uint i = 0;i<insertValues.length;i++){
            values.push(insertValues[i]);
            indexes[insertValues[i]] = -1;                                                      //if we assign once we prevent this having to be repeated by users
        }
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
        uint currPos = 0;
        uint semirandom = uint256(keccak256(block.timestamp, block.difficulty))%trueLength;
        iter = semirandom;
       while (trueLength > 0){
           if(finalValue-price > 42000){
                if(allFunders[iter] != address(0)){
                    allFunders[iter].transfer(addressToValue[allFunders[iter]].fund - uint(price));
                    funderList.push(allFunders[iter]);
                    trueLength--;
                }
           }else{
               if(allFunders[iter] != address(0)){
                   if(currPos == semirandom){
                       allFunders[iter].transfer(address(this).balance - goal);
                   }
                   currPos++;
                }
           }
           iter++;
       }

        
        delete values;
        delete goal;
        delete finishTime;
    }
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    function getFunderList() public view returns (address[] memory){
        return funderList;
    }
}
