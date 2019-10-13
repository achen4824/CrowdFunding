pragma solidity >=0.4.22 <0.6.0;

contract crowdfunding{

    struct offer{
        address previous;
        address next;
        uint priceperVal;
        uint amtShares;
        uint value;
    }
    
    //Variables
    uint finishTime;
    int sharesALL;
    address public headOffers;
    address owner;
    address[] shareHolders;
    mapping(address => offer) userToOffer;
    mapping(address => uint) userToShares;
    
    //Constructor
    constructor(uint daysCompletion, int sharesT) public {
        require(sharesDistributed != 0,"Need goal to be more than zero");
        require(insertValues.length != 0, "Need values");
        owner = msg.sender;
        sharesALL = sharesT;
        
        userToShares[owner] = sharesT;

        //finishTime = now + (24 * 60 * 60 * daysCompletion);
    }
    
    //Check allowed values
    function getValues() public view returns (uint[] memory){
        return values;
    }
    
    //insert into linked list after current offer
    function insertBehind(address prev,address current, offer insert) private{
        //link nodes
        userToOffer[current].previous = prev;
        userToOffer[current].next = userToOffer[prev].next;
        userToOffer[prev].next = current;
        userToOffer[userToOffer[current].next].previous = current;

        //set internal values
        userToOffer[current].priceperVal = insert.priceperVal;
        userToOffer[current].amtShares = insert.amtShares;
        userToOffer[current].value = insert.value;
    }

    
    //fund if amtShares is 0 refund user
    function fund(uint amtShares) external payable{
        //Validate funding
        require(now < finishTime,"Funding period is over");
        require(msg.value > 0,"There is no bid value");
        require(indexes[msg.value] != 0,"Invalid fund amount only these are allowed check getValues()");

        //initialize offer
        offer createdOffer;
        createdOffer.priceperVal = msg.value/amtShares;
        createdOffer.amtShares = amtShares;
        createdOffer.value = msg.value;

        //check user doesn't currently have any offer
        if(userToOffer[msg.sender].amtShares != 0){

            msg.sender.transfer(userToOffer[msg.sender].value);

            //remove offer from linked list
            userToOffer[userToOffer[msg.sender].previous].next = userToOffer[msg.sender].next;
            userToOffer[userToOffer[msg.sender].next].previous = userToOffer[msg.sender].previous;
            if(amtShares == 0){
                delete userToOffer[msg.sender];
                revert("Refunded User: Cancelled Offer");
            }else{
                //insert by navigating list o(n) worst case
                address iterator = msg.sender;
                if(createdOffer.priceperVal > userToOffer[iterator]){
                    while(createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                        if(iterator == headOffers){ break; }
                        iterator = userToOffer[iterator].previous;
                    }
                    if(iterator == headOffers){
                        iterator.previous = msg.sender;
                        userToOffer[msg.sender] = createdOffer;
                        userToOffer[msg.sender].next = iterator;
                    }else{
                        insertBehind(iterator,msg.sender,createdOffer);
                    }
                }else{
                    while(createdOffer.priceperVal <= userToOffer[iterator].priceperVal){
                        if(userToOffer[iterator].next == 0){ break; }
                        iterator = userToOffer[iterator].next;
                    } 
                    insertBehind(iterator,msg.sender,createdOffer);
                }
            }
        }
        //user's offer
        else{
            address iterator = headOffers;
            while(createdOffer.priceperVal <= userToOffer[iterator].priceperVal){
                if(userToOffer[iterator].next == 0){ break; }
                iterator = userToOffer[iterator].next;
            } 
            if(iterator == headOffers){
                iterator.previous = msg.sender;
                userToOffer[msg.sender] = createdOffer;
                userToOffer[msg.sender].next = iterator;
            }else{
                insertBehind(iterator,msg.sender,createdOffer);
            }
        }
        

    }
    
    //End crowdfunding callable by anyone to resign control from the creator
    function finishFunding() public {
        
    }

    //generic share transfer
    function transfer(address reciever,uint amt){
        require(amt =< userToShares[msg.sender], "Lack of Funds");
        userToShares[msg.sender] -= amt;
        userToShares[reciever] += amt;
    }

    function balanceOf() public view returns (uint) {
        return userToShares[msg.sender];
    }

    

}