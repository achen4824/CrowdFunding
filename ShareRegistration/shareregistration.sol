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
    uint amtOffers;
    uint sharesALL;
    address public headOffers;
    address owner;
    address[] shareHolders;
    mapping(address => offer) userToOffer;
    mapping(address => uint) userToShares;
    
    //Constructor
    constructor(uint daysCompletion, uint sharesT) public {
        require(sharesT != 0,"Need goal to be more than zero");
        owner = msg.sender;
        sharesALL = sharesT;
        amtOffers = 0;
        userToShares[owner] = 0; //redo later

        finishTime = now + (24 * 60 * 60 * daysCompletion);
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
        userToOffer[current].value = insert.value;
    }

    
    //fund if amtShares is 0 refund user
    function fund(uint amtShares) external payable{
        //Validate funding
        //require(now < finishTime,"Funding period is over");
        offer memory createdOffer;
        if(amtShares != 0){        //initialize offer
            createdOffer.priceperVal = msg.value/amtShares;
            createdOffer.amtShares = amtShares;
            createdOffer.value = msg.value;
        }

        //check user doesn't currently have any offer
        if(userToOffer[msg.sender].amtShares != 0){

            msg.sender.transfer(userToOffer[msg.sender].value);

            //remove offer from linked list
            if(msg.sender != headOffers){
                userToOffer[userToOffer[msg.sender].previous].next = userToOffer[msg.sender].next;
            }else{
                headOffers = userToOffer[msg.sender].next;
            }
            if(userToOffer[msg.sender].next != address(0)){
                userToOffer[userToOffer[msg.sender].next].previous = userToOffer[msg.sender].previous;
            }
            if(amtShares != 0){
                //insert by navigating list o(n) worst case
                address iterator = msg.sender;
                if(createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                    while(createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                        iterator = userToOffer[iterator].previous;
                        if(iterator == headOffers){ break; }
                    }
                    if(iterator == headOffers && createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                        userToOffer[iterator].previous = msg.sender;
                        userToOffer[msg.sender] = createdOffer;
                        userToOffer[msg.sender].next = iterator;
                        headOffers = msg.sender;
                    }else if(createdOffer.priceperVal > userToOffer[iterator].priceperVal){
                        insertBehind(userToOffer[iterator].previous,msg.sender,createdOffer);
                    }
                    else{
                        insertBehind(iterator,msg.sender,createdOffer);
                    }
                }else{
                    if(iterator == headOffers){
                        headOffers = userToOffer[headOffers].next;
                    }
                    while(createdOffer.priceperVal <= userToOffer[iterator].priceperVal){
                        if(userToOffer[iterator].next == address(0)){ break; }
                        iterator = userToOffer[iterator].next;
                    } 
                    insertBehind(iterator,msg.sender,createdOffer);
                }
            }else{
                delete userToOffer[msg.sender];
                amtOffers--;
            }
        }
        //user's offer
        else{
            address iterator = headOffers;
            amtOffers++;
            while(createdOffer.priceperVal <= userToOffer[iterator].priceperVal){
                if(userToOffer[iterator].next == address(0)){ break; }
                iterator = userToOffer[iterator].next;
            } 
            if(headOffers == address(0)){
                headOffers = msg.sender;
                userToOffer[msg.sender] = createdOffer;
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
        

    }
    
    //End crowdfunding callable by anyone to resign control from the creator
    function finishFunding() public {
        
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

    //check whether offer is up for consideration and can be refunded in O(1)
    function checkOffer() public view returns (bool) {
        //require(now < finishTime,"Funding period is over");
        require(userToOffer[msg.sender].amtShares != 0,"No Offer with this Address");
        address iterator = headOffers;
        uint total = 0;
        while(iterator != msg.sender){
            total += userToOffer[iterator].amtShares;
            iterator = userToOffer[iterator].next;
        }
        if(total > sharesALL - userToShares[owner]){
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
