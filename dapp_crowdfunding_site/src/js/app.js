
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

  initContract:async  function() {
    await $.getJSON("storeData.json", function(storeData) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.storeData = TruffleContract(storeData);
      // Connect provider to interact with contract
      App.contracts.storeData.setProvider(App.web3Provider);
    });
    await $.getJSON("crowdfunding.json", function(crowdfund) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.crowdfunding = TruffleContract(crowdfund);
      // Connect provider to interact with contract
      App.contracts.crowdfunding.setProvider(App.web3Provider);

    });
    return App.render();
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

  getList: async function(){
    var ownerlist;
    var contractList;
    var theUsers = App.contracts.storeData.deployed().then(function(instance) { return instance.usergetList({ from: App.account });  }).then(async function(userList){
      $('#usercrowdfund').html("");
      for(var i =0;i<userList.length;i++){
        //await
        await App.contracts.crowdfunding.at(userList[i]).then(async function(currInstance){
          var description = await currInstance.getDescription();
          var GoalCompletion = (await currInstance.getBalance() / await currInstance.getGoal())*100;
          var strGoal = ((await currInstance.getGoal())/1000000000000000000*262.64).toFixed(2).toString();

          var timeSec = ((await currInstance.getTime())).toString();

          var theList = "<section id='section"+currInstance.address+"'><div style='float:left'><h3>"+ currInstance.address +"</h3><p>Time: <span id='time"+currInstance.address+"'></span>\tGoal: $"+strGoal+"<br>"+  description +"</p><div style='width:100%;height:1em;border-color:#ffd5f0;border-width:thin;border-style:solid;border-radius:1em;overflow:hidden'><div style='width:"+GoalCompletion.toString()+"%;height:100%;background-color:#ffd5f0;border-radius:1em;background-opacity:20%' ></div></div></div>";
          setInterval(function(){ App.constantTime(timeSec,currInstance.address)},1000);
          var boolTest = await currInstance.hasFund();
          if(!boolTest){
            theList += "<form style='float: right;'>";
            await currInstance.getValues().then(function(currValues){
              theList += '<select style="margin-bottom: 0.5em"  id="fundingSelectUser'+currInstance.address+'">'
              for(var a =0;a<currValues.length;a++){
                theList += "<option value=" + currValues[a] + " >$" + ((currValues[a]/1000000000000000000)*262.64).toFixed(2).toString()  + "</ option>";
              }
              theList += '</select><button type="button" onclick="App.fundContract(\''+currInstance.address+'\');return false;" class="button" >Fund</button>'
            })
            theList += "</form>";
          }else{
            theList += "<p>   (Already Funding this Project)</p>";
          }
          theList += "</section>";
          $('#usercrowdfund').append(theList);
        })
        
      }
    })
    var theOthers = App.contracts.storeData.deployed().then(function(instance) { return instance.nonusergetList({ from: App.account });  }).then(async function(userList){
      $('#othercrowdfund').html("");
      for(var i =0;i<userList.length;i++){
        //await
        await App.contracts.crowdfunding.at(userList[i]).then(async function(currInstance){
          var description = await currInstance.getDescription();
          var GoalCompletion = (await currInstance.getBalance() / await currInstance.getGoal())*100;
          var strGoal = ((await currInstance.getGoal())/1000000000000000000*262.64).toFixed(2).toString();

          var timeSec = ((await currInstance.getTime())).toString();

          var theList = "<section id='section"+currInstance.address+"'><div style='float:left'><h3>"+ currInstance.address +"</h3><p>Time: <span id='time"+currInstance.address+"'></span>\tGoal: $"+strGoal+"<br>"+  description +"</p><div style='width:100%;height:1em;border-color:#ffd5f0;border-width:thin;border-style:solid;border-radius:1em;overflow:hidden'><div style='width:"+GoalCompletion.toString()+"%;height:100%;background-color:#ffd5f0;border-radius:1em;background-opacity:20%' ></div></div></div>";
          setInterval(function(){ App.constantTime(timeSec,currInstance.address)},1000);
          var boolTest = await currInstance.hasFund();
          if(!boolTest){
            theList += "<form style='float: right;'>";
            await currInstance.getValues().then(function(currValues){
              theList += '<select style="margin-bottom: 0.5em"  id="fundingSelectUser'+currInstance.address+'">'
              for(var a =0;a<currValues.length;a++){
                theList += "<option value=" + currValues[a] + " >$" + ((currValues[a]/1000000000000000000)*262.64).toFixed(2).toString()  + "</ option>";
              }
              theList += '</select><button type="button" onclick="App.fundContract(\''+currInstance.address+'\');return false;" class="button" >Fund</button>'
            })
            theList += "</form>";
          }else{
            theList += "<p>   (Already Funding this Project)</p>";
          }
          theList += "</section>";
          $('#othercrowdfund').append(theList);
        })
        
      }
    })

    
    await Promise.all([theUsers, theOthers]);
    $('body').show();
  },

  fundContract: async function(addressID){
    await App.contracts.crowdfunding.at(addressID).then(async function(currInstance){
      await currInstance.fund({from: App.account,value: $('#fundingSelectUser'+addressID).val()});
      console.log("confirmed?");
      
      var description = await currInstance.getDescription();
      var GoalCompletion = (await currInstance.getBalance() / await currInstance.getGoal())*100;
      var strGoal = ((await currInstance.getGoal())/1000000000000000000*262.64).toFixed(2).toString();

      var timeSec = ((await currInstance.getTime())).toString();

      var theList = "<div style='float:left'><h3>"+ currInstance.address +"</h3><p>Time: <span id='time"+currInstance.address+"'></span>\tGoal: $"+strGoal+"<br>"+  description +"</p><div style='width:100%;height:1em;border-color:#ffd5f0;border-width:thin;border-style:solid;border-radius:1em;overflow:hidden'><div style='width:"+GoalCompletion.toString()+"%;height:100%;background-color:#ffd5f0;border-radius:1em;background-opacity:20%' ></div></div></div>";
      setInterval(function(){ App.constantTime(timeSec,currInstance.address)},1000);
      var boolTest = await currInstance.hasFund();
      if(!boolTest){
        theList += "<form style='float: right;'>";
        await currInstance.getValues().then(function(currValues){
          theList += '<select style="margin-bottom: 0.5em"  id="fundingSelectUser'+currInstance.address+'">'
          for(var a =0;a<currValues.length;a++){
            theList += "<option value=" + currValues[a] + " >$" + ((currValues[a]/1000000000000000000)*262.64).toFixed(2).toString()  + "</ option>";
          }
          theList += '</select><button type="button" onclick="App.fundContract(\''+currInstance.address+'\');return false;" class="button" >Fund</button>'
        })
        theList += "</form>";
      }else{
        theList += "<p>   (Already Funding this Project)</p>";
      }
      $('#section'+addressID).html(theList);
      
      //return App.getList();
      
    })
  },

  createContract: async function(){
    var goals = $('#goal').val() * 1000000000000000000;
    var days = $('#days').val();
    var description = $('#description').val();
    await App.contracts.crowdfunding.new(days,goals,description,{from: App.account}).then(function(currInstance){
      App.contracts.storeData.deployed().then(async function(instance2) {
        await instance2.createCrowdFund(currInstance.address,{from: App.account});
        
        var description = await currInstance.getDescription();
        var GoalCompletion = (await currInstance.getBalance() / await currInstance.getGoal())*100;
        var strGoal = ((await currInstance.getGoal())/1000000000000000000*262.64).toFixed(2).toString();

        var timeSec = ((await currInstance.getTime())).toString();

        var theList = "<section id='section"+currInstance.address+"'><div style='float:left'><h3>"+ currInstance.address +"</h3><p>Time: <span id='time"+currInstance.address+"'></span>\tGoal: $"+strGoal+"<br>"+  description +"</p><div style='width:100%;height:1em;border-color:#ffd5f0;border-width:thin;border-style:solid;border-radius:1em;overflow:hidden'><div style='width:"+GoalCompletion.toString()+"%;height:100%;background-color:#ffd5f0;border-radius:1em;background-opacity:20%' ></div></div></div>";
        setInterval(function(){ App.constantTime(timeSec,currInstance.address)},1000);
        var boolTest = await currInstance.hasFund();
        if(!boolTest){
          theList += "<form style='float: right;'>";
          await currInstance.getValues().then(function(currValues){
            theList += '<select style="margin-bottom: 0.5em"  id="fundingSelectUser'+currInstance.address+'">'
            for(var a =0;a<currValues.length;a++){
              theList += "<option value=" + currValues[a] + " >$" + ((currValues[a]/1000000000000000000)*262.64).toFixed(2).toString()  + "</ option>";
            }
            theList += '</select><button type="button" onclick="App.fundContract(\''+currInstance.address+'\');return false;" class="button" >Fund</button>'
          })
          theList += "</form>";
        }else{
          theList += "<p>   (Already Funding this Project)</p>";
        }
        theList += "</section>";
        $('#usercrowdfund').append(theList);
        //return App.getList();
        
      })
    })
  },

  constantTime: function(initialTime,id){
    var seconds = new Date().getTime() / 1000;
    var timeSec = initialTime;
    var sec_num = parseInt(timeSec, 10) - seconds; // don't forget the second param
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = (sec_num - (hours * 3600) - (minutes * 60)).toFixed(0);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    timeSec =  hours+':'+minutes+':'+seconds;
    $('#time'+id).html(timeSec);
  }

};

$(function() {
  $(window).on('load',function() {
    $('body').hide();
	  console.log("start");
    App.init();
	console.log("finish");
  });
});
