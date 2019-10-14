pragma solidity >=0.4.22 <0.6.0;

//TODO
// Implement voting system to approve smart contracts

contract crowdfunding{

    //double linked list node
    struct offer{
        address previous;
        address next;
        uint priceperVal;
        uint amtShares;
    }

    struct proposal{
        address payable contractAddress;
        uint endTime;
        uint votesFor;
        uint votesAgainst;
        uint votesAbstained;
        mapping(address => bool) alreadyVoted;
        mapping(address => uint) voteNum;
    }
    
    //Variables
    uint finishTime;
    uint amtOffers;
    uint sharesALL;
    uint daysCompletion;
    bool startFund;
    address public headOffers;
    address owner;
    proposal[] currentProposals;
    address[] activeContractsList;
    mapping(address => bool) activeContracts;
    mapping(address => offer) userToOffer;
    mapping(address => uint) userToShares;

    //delegatecall 

    
    //Constructor
    constructor(uint idaysCompletion, uint sharesT) public {
        require(sharesT != 0,"Need goal to be more than zero");
        owner = msg.sender;
        sharesALL = sharesT;
        amtOffers = 0;
        daysCompletion = idaysCompletion;
        userToShares[owner] = sharesT;
        startFund = false;
        finishTime = now;
    }
    
    function startDistribution(uint releaseShares) public{
        startFund = true;
        finishTime = now + (24 * 60 * 60 * daysCompletion);
        userToShares[owner] -= releaseShares;
    }

    //End crowdfunding callable by anyone
    function finishFunding() public {
        require(startFund);
        require(now > finishTime,"Funding period is not done");
        address iterator = headOffers;
        uint releasedShares = sharesALL - userToShares[owner];
        while(iterator != address(0) && releasedShares != 0){
            if(userToOffer[iterator].amtShares <= releasedShares){
                //prevent re-entrance attack
                uint tempShares = userToOffer[iterator].amtShares;
                userToOffer[iterator].amtShares = 0;
                releasedShares -= tempShares;
                userToShares[iterator] += tempShares;
            }else{
                //prevent re-entrance attack
                uint temp = releasedShares;
                releasedShares = 0;
                userToShares[iterator] += temp;
            }
            iterator = userToOffer[iterator].next;
            //negative gas costs
            delete userToOffer[iterator].previous;
        }
        delete userToOffer[iterator];
        if(releasedShares != 0){
            userToShares[owner] += releasedShares;
        }
        daysCompletion = 7;
    }

    //to allow for modification of state by other contracts
    //allows for upgrading of proposals decided by a voting system
    //ask for eth stake to prevent spamming proposals
    function createProposal(address _addr) public returns (uint){
        require(startFund);
        require(now > finishTime,"Funding period is not done");
        uint32 size;
        //one week delay
        assembly {
            size := extcodesize(_addr)
        }
        require(size > 0,"This must be a deployed contract");
        for(uint i = 0;i<currentProposals.length;i++){
            if(currentProposals[index].contractAddress == address(0)){
               currentProposals[index] = proposal(_addr , (now + (24 * 60 * 60 * daysCompletion)),0,0,0);
               return 0;
            }
        }
        currentProposals.push (proposal(_addr , (now + (24 * 60 * 60 * daysCompletion)),0,0,0));
        return 0;
    }

    //vote 0 against 1 is for anything else is abstained
    function voteProposal(uint index,uint vote) public{
        require(index < currentProposals.length, "Invalid Index");
        require(now < currentProposals[index].endTime, "Voting Period is over");
        if(currentProposals[index].alreadyVoted[msg.sender]){
            if(currentProposals[index].voteNum[msg.sender] == 0){
                currentProposals[index].votesAgainst -= userToShares[msg.sender];
            }else if(currentProposals[i].voteNum[msg.sender] == 1){
                currentProposals[index].votesFor -= userToShares[msg.sender];
            }else{
                currentProposals[index].votesAbstained -= userToShares[msg.sender];
            }
        }
        if(vote == 0){
            currentProposals[i].votesAgainst += userToShares[msg.sender];
        }else if(vote == 1){
            currentProposals[i].votesFor += userToShares[msg.sender];
        }else{
            currentProposals[i].votesAbstained += userToShares[msg.sender];
        }
        currentProposals[index].voteNum[msg.sender] = vote;
        currentProposals[index].alreadyVoted[msg.sender] = true;
    }

    function finalizeProposal(uint index) public returns (bool){
        require(now > currentProposals[index].endTime, "Voting Period is not finished");
        if(currentProposals[index].votesFor + currentProposals[index].votesAgainst + currentProposals[index].votesAbstained > sharesALL / 2 && currentProposals[index].votesAgainst < currentProposals[index].votesFor){
            currentProposals[index].contractAddress.delegatecall(abi.encodeWithSignature("modifyContract()"));
            delete currentProposals[index];
            return true;
        }else{
            delete currentProposals[index];
            return false;
        }

    }
    //insert into linked list after current offer
    function insertBehind(address prev,address current, offer memory insert) private{
        //link nodes
        userToOffer[current].previous = prev;
        userToOffer[current].next = userToOffer[prev].next;
        userToOffer[prev].next = current;
        if(userToOffer[current].next != address(0)){
            userToOffer[userToOffer[current].next].previous = current;
        }

        //set internal values
        userToOffer[current].priceperVal = insert.priceperVal;
        userToOffer[current].amtShares = insert.amtShares;
    }

    
    //fund if amtShares is 0 refund user
    function offerShare(uint amtShares) external payable{
        //Validate funding
        require(msg.value > 11578000000000, "Minimum bid"); released from testing later
        require(msg.value % amtShares == 0, "Please choose an integer amount for price per share");
        require(now < finishTime,"Funding period is closed");

        offer memory createdOffer;
        if(amtShares != 0){        //initialize offer
            createdOffer.priceperVal = msg.value/amtShares;
            createdOffer.amtShares = amtShares;
        }

        //check user doesn't currently have any offer
        if(userToOffer[msg.sender].amtShares != 0){
            
            //prevent re-entrance
            uint refund = userToOffer[msg.sender].amtShares * userToOffer[msg.sender].priceperVal;
            userToOffer[msg.sender].amtShares = 0;
            msg.sender.transfer(refund);

            //remove offer from linked list
            if(msg.sender != headOffers){
                userToOffer[userToOffer[msg.sender].previous].next = userToOffer[msg.sender].next;
            }else{
                headOffers = userToOffer[msg.sender].next;
            }
            if(userToOffer[msg.sender].next != address(0)){
                userToOffer[userToOffer[msg.sender].next].previous = userToOffer[msg.sender].previous;
            }
            
        }else{
            amtOffers++;
        }
        //insert new offer
        if(amtShares != 0){
            address iterator = headOffers;
            if(headOffers == address(0)){
                headOffers = msg.sender;
                userToOffer[msg.sender] = createdOffer;
            }else{
                while(createdOffer.priceperVal <= userToOffer[iterator].priceperVal){
                    if(userToOffer[iterator].next == address(0)){ break; }
                    iterator = userToOffer[iterator].next;
                } 
                if(iterator == headOffers && createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                    userToOffer[iterator].previous = msg.sender;
                    userToOffer[msg.sender] = createdOffer;
                    userToOffer[msg.sender].next = iterator;
                    headOffers = msg.sender;
                }else if(createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                    insertBehind(userToOffer[iterator].previous,msg.sender,createdOffer);
                }else{
                    insertBehind(iterator,msg.sender,createdOffer);
                }
            }
        }else{
            amtOffers--;
            delete userToOffer[msg.sender];
        }

    }

    //generic share transfer
    function transfer(address reciever,uint amt) public{
        require(amt <= userToShares[msg.sender], "Lack of Funds");
        userToShares[msg.sender] -= amt;
        userToShares[reciever] += amt;
    }

    //check balance
    function balanceOf() public view returns (uint) {
        return userToShares[msg.sender];
    }

    //check whether offer is up for consideration
    function checkOffer() public view returns (bool) {
        require(now < finishTime,"Funding period is over");
        require(userToOffer[msg.sender].amtShares != 0,"No Offer with this Address");
        address iterator = headOffers;
        uint total = 0;
        while(iterator != msg.sender){
            total += userToOffer[iterator].amtShares;
            iterator = userToOffer[iterator].next;
        }
        if(total >= sharesALL - userToShares[owner]){
            return false;
        }else{
            return true;
        }
    }

    //for debugging
    function getList() public view returns (uint[] memory){
        uint[] memory allOffers = new uint[](amtOffers*2);
        address iterator = headOffers;
        uint i = 0;
        while(iterator != address(0)){
            allOffers[i] = userToOffer[iterator].priceperVal;
            i++;
            allOffers[i] = userToOffer[iterator].amtShares;
            iterator = userToOffer[iterator].next;
            i++;
        }
        return allOffers;
    }

}
