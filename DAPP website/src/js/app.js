App = {
  web3Provider: null,
  contracts: {},
  account: '0x0',

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function () {
    // TODO: refactor conditional
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
      ethereum.enable();
      web3 = new Web3(web3.currentProvider);
    } else {
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      ethereum.enable();
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },

  initContract: function() {
    $.getJSON("storeData.json", function(crowdfund) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.storeData = TruffleContract(crowdfund);
      // Connect provider to interact with contract
      App.contracts.storeData.setProvider(App.web3Provider);

      return App.render();
    });
    $.getJSON("crowdfunding.json", function(crowdfund) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.crowdfunding = TruffleContract(crowdfund);
      // Connect provider to interact with contract
      App.contracts.crowdfunding.setProvider(App.web3Provider);

      return App.render();
    });
  },

  render: function(){
    var deployInstance;

    // Load account data
    web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        App.account = account;
      }
    });
    return App.getList();
  }, 
  getList: function(){
    var ownerlist;
    var contractList;
    App.contracts.storeData.deployed().then(function(instance) {
      return instance.usergetList({ from: App.account });
    }).then(async function(userList){
      var theList;
      for(var i =1;i<userList.length;i+=2){
        //await
        console.log(userList);
        await App.contracts.crowdfunding.at(userList[i]).then(function(currInstance){
          currInstance.getDescription().then(async function(description){
            var GoalCompletion = (await currInstance.getBalance() / await currInstance.getGoal())*100;
            console.log(GoalCompletion);
            theList = "<section><div style='float:left'><h3>Crowdfund at "+ currInstance.address +"</h3><p>"+  description +"</p><div style='width:100%;height:1em;background-color:red;border-radius:1em;overflow:hidden'><div style='width:"+GoalCompletion.toString()+"%;height:100%;background-color:green' ></div></div></div>";
            var boolTest = await currInstance.hasFund();
            if(!boolTest){
              theList += "<form style='float: right;' onSubmit='App.fundContract(\""+currInstance.address+"\");return false;'>";
              await currInstance.getValues().then(function(currValues){
                theList += '<select style="margin-bottom: 0.5em"  id="fundingSelectUser'+currInstance.address+'">'
                for(var a =0;a<currValues.length;a++){
                  theList += "<option value=" + currValues[a] + " >$" + ((currValues[a]/1000000000000000000)*262.64).toFixed(2).toString()  + "</ option>";
                }
                theList += '</select><button type="submit" class="button" >Fund</button>'
              })
              theList += "</form>";
            }
            theList += "</section>";
            $('#usercrowdfund').html(theList);
          })
        })
      }
    })
  },

  fundContract: async function(addressID){
    console.log(addressID);
    App.contracts.crowdfunding.at(addressID).then(function(currInstance){
      console.log($('#fundingSelectUser'+addressID).val());
      currInstance.fund({from: App.account,value: $('#fundingSelectUser'+addressID).val()});
    })
  }

};

$(function() {
  $(window).on('load',function() {
    App.init();
  });
});
