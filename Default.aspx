<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ParamaPadaSophanamM._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <style>

 
.flex {
    display: flex;
    width:100%;
}
.sameRow {
    border: 2px solid black;
    
    width: 48%;
}
 

        .playerspanhidden {
            visibility:hidden;
           
            z-index:10;
            position:page;
              width: 150px;
  height: 150px;
  line-height: 50px;
  border-radius: 150%;
        }
          .playerspanvisible {
            visibility:visible;
            
            z-index:10;
            position:page;
             
  border-radius: 150%;
        }
        .cellbutton {
            visibility:visible;
            border-bottom-width:thin;
            border-width:thin;
            width:41px;
            height:32px;
            border-style:none;
            background-color: transparent;
            text-align:end right bottom;
            text-decoration-color:transparent;
            color:transparent;
        }
        canvas {
            border:solid thin;
            visibility:visible;
           /* width:440px;
            height:520px;*/
        }
        .tblBackground {
        border:solid thin;
      
        }
        .grid-container {
        display:grid;
        grid-gap:0px;
        /*grid-gap:2px;*/
      /*  background-color:red;*/
       /* grid-column-start:1;
        grid-column-end:11;*/
       grid-template-columns: auto auto auto auto auto auto auto auto auto auto auto; 
          width:455px;
            height:436px;
            background-color: red;
            background-image:url("ParamaPada.jpg");
            background-size:auto;
            background-repeat:no-repeat;
            
       }
        .circlex {
  width: 150px;
  height: 150px;
  line-height: 50px;
  border-radius: 150%;
}
    </style>

    <div id="divLog" style="display:none">
         <input type="hidden" id="HiddenClientID" name="HiddenClientID" value="<%=Guid.NewGuid().ToString()%>" />
        
        <table>
                <tr style="height:100%">
                 <td colspan="2" style="height:100px;overflow:auto;">
                     
                     <div id="divaLog" style="height:300px;overflow:auto;"></div>
                 </td>
             </tr>
            <tr>
                <td>
                             <input type="button" onclick="javascript: btn_HideLog();" value="Hide Log" id="btnHideLog"  />
                </td>
            </tr>
        </table>
    </div>
    <div  id="diveSettings">
              <div >
         <table>
             <tr>
                 <td> 
                    
     <%--<button id="btnRollDice" onclick="javascript: rolldice();">Click</button>--%></td>
             </tr>
             <tr>
                 <td colspan="2" >
                     <label id="lblDiceNumber"></label>
                 </td>
             </tr>
             <tr><td>Join Game or Create new one</td>
                 <td><input type="text" id="txtBoardName" value="<%=pageloadGUId%>" /></td>
                 <td>
                     <input id="btnJoin" type="button" value="Join Game"  onclick="javascript: CreateORJoinGroup(0);" />
                 </td>
                 <td>
                     <input id="btnCreatenewGame" type="button" value="Create New" onclick="javascript: CreateORJoinGroup(1);" />
                 </td>
             </tr>
             <tr>
                 <td>No Of Players</td>
                 <td> <select id="selNoOFPlayers" name="D1">
          <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           <option value="4">4</option>
           <option value="5">5</option>
     </select></td>
                 <td> <input id="btnSetNoOfPlayers" type="button" value="Set Players" onclick="javascript:setPlayer()" /></td>
             </tr>
             <tr>
                 <td>Player Number</td>
                 <td><select id="selPlayer" readonly>
         <option value="0">Empty Slot</option>
           <option value="1">Empty Slot</option>
           <option value="2">Empty Slot</option>
           <option value="3">Empty Slot</option>
           <option value="4">Empty Slot</option>
           
     </select><input type="text" id="txtPlayerName" value="Player Name" />
         </td>
                 <td><%--<input id="btnSetPlayer" type="button" value="Set Player" onclick="javascript: SetCurrentPlayer();" />--%>
       </td>
             </tr>

    <%--         <tr>
                 <td>Active Player</td>
                 <td><input type="text" id="txtActivePlayer" /> </td>
             </tr>--%>
            <tr>
                <td>
                    Player Joined
                </td>
                <td>
                    <input type="text" id="lblPlayerJoined" />
                </td>
            </tr>
         <%--    <tr style="height:100%">
                 <td colspan="2" style="height:100px;overflow:auto;">
                     
                     <div id="divaLog" style="height:300px;overflow:auto;"></div>
                 </td>
             </tr>--%>
         </table>
 
     </div> 

    </div>
 
  
   <div  class="flex" style="width:100%;display:none;" id="divBoard" >
      <div class="xsameRow" xstyle="float:left;width:39%;">
     <div id="divBackground" class="grid-container"></div>
          
          <table>
              <tr>
                  <td> 
                      <input type="button" onclick="javascript: rolldice();" value="Roll Dice" id="btnRollDice" disabled="disabled" />
                      <input type="button" onclick="javascript: btn_DisplayLog();" value="Display Log" id="btnDisplayLog" />
                  </td>
              </tr>
                       <tr>
                 <td>Active Player</td>
                 <td><input type="text" id="txtActivePlayer" /> </td>
             </tr>
 <%--           <tr>
                <td>
                    Player Joined
                </td>
                <td>
                    <input type="text" id="lblPlayerJoined" />
                </td>
            </tr>--%>
          </table>
      </div>
  
 </div> 
    <div>  
           <%--<circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />--%>
          <span    id="players0" name="players" class="playerspanhidden"  title="1" style="background-color:brown;color:white;align-content:center;text-align:center;align-items:center;"  > 1 </span>
          <span    id="players1" name="players" class="playerspanhidden"  title="2" style="background-color:blueviolet;color:white;text-align:center;align-content:center;align-items:center;"> 2 </span>
          <span    id="players2" name="players" class="playerspanhidden"  title="3" style="background-color:coral;color:white;text-align:center;align-content:center;align-items:center;"> 3 </span>
          <span    id="players3" name="players" class="playerspanhidden"  title="4" style="background-color:blue;color:white;text-align:center;align-content:center;align-items:center;" > 4 </span>
          <span    id="players4" name="players" class="playerspanhidden"  title="5" style="background-color:salmon;color:white;text-align:center;align-content:center;align-items:center;"> 5 </span>
    </div>
 <%--   <table id="tblBoard" class="tblBackground"></table> 
        <table id="tblCanvasBoard" class="tblBackground"></table> --%>
    <%--<canvas id="canvasBackGRD" > </canvas>--%>
    <script src="Scripts/jquery-3.4.1.min.js" ></script>
     <script src="Scripts/jquery.signalR-2.2.2.min.js"></script>
     <script src="signalr/hubs"></script>
   
     <script type="text/javascript">

         var arrControl = [];
         var arrPlayer = [];
         arrControl.length = 133;

         var playerstandings = [0, 0, 0, 0, 0];
         var activePlayer = 0;
         var playerCount = 0;

         var thisScreenPlayer = 0;

         var timerEnabled = false;

         var strThisScreenID = "<%=Guid.NewGuid().ToString()%>";
         var chat = $.connection.sendToClients;
         chat.connection.id
         function SetCurrentPlayer() {
             var ddlSetPlayer = document.getElementById('selPlayer');
             thisScreenPlayer = ddlSetPlayer.options[ddlSetPlayer.selectedIndex].value;
            // alert(activePlayer);
             SetActivePlayer(activePlayer);

             $.connection.hub.start().done(function () {
                 chat.server.playerJoined($('#txtBoardName').val(), thisScreenPlayer, playerstandings[thisScreenPlayer]);
             });
             setSettings();
         }
         function setBoard() {


             var tabBoard = document.getElementById('tblBoard');
             var tblCanvasBoardvar = document.getElementById('tblCanvasBoard');
             var divdivBackground = document.getElementById('divBackground');
             var CellLabel = 133;
             var i = 0;
             var j = 0;

             for (i = 1; i < 13; i++) {
                 var tabHr = document.createElement('tr');
                 if ((i % 2) == 0) {
                     CellLabel = CellLabel - 12;
                     for (j = 11; j > 0; j--) {
                         CellLabel++;
                          var btnLable = document.createElement('label');
                         btnLable.textContent = CellLabel.toString();
                      //   btnLable.addEventListener("click", showcellDescription(CellLabel.toString()));
                         btnLable.className = "cellbutton";
                         arrControl[CellLabel] = btnLable;
                         divdivBackground.appendChild(btnLable);
                    
                     }

                     CellLabel = CellLabel - 10;
                 }
                 else {
                     for (j = 0; j < 11; j++) {
                         CellLabel--;
                   
                         var btnLable = document.createElement('label');
                         btnLable.textContent = CellLabel.toString();
                         btnLable.className = "cellbutton";
                         btnLable.addEventListener("click", showcellDescription(CellLabel.toString()));
                         arrControl[CellLabel] = btnLable;
                         divdivBackground.appendChild(btnLable);
                     }
                 }
             }
            


            // alert('done');

             //  divdivBackground.style.display = 'none';
         }
         function showcellDescription(cellnumber) {
          //   alert(cellnumber);
         }

         function setPlayer()
         {
             var ddlSetPlayer = document.getElementById('selNoOFPlayers');
            var PlayerCount = ddlSetPlayer.options[ddlSetPlayer.selectedIndex].value;
             SetNumberOfPlayersCount(PlayerCount);
           
             $.connection.hub.start().done(function () {
                 chat.server.sendNumberOfPlayersToClient($('#txtBoardName').val(), PlayerCount);
             });   
         }
         function SetNumberOfPlayersCount(PlayerCount) {
          //   var ddlSetPlayer = document.getElementById('selNoOFPlayers');
         //    PlayerCount = ddlSetPlayer.options[ddlSetPlayer.selectedIndex].value;

             arrPlayer.length = PlayerCount;
     
             for (i = 0; i < PlayerCount; i++) {
                 var divdivplayers0 = document.getElementById('players' + i.toString());
                 divdivplayers0.className = 'playerspanvisible';
             }
             playerCount = PlayerCount;

           //  alert(playerCount);
         }

         function rolldice() {

             var varlblDiceNumber = document.getElementById('lblDiceNumber');
             timerEnabled = true;

             while (this.timerEnabled) {

                 varlblDiceNumber.textContent = Math.round(1 + (Math.random() * 5)).toString();
                 if ((Math.round(Math.random() * 6) == 6))
                     timerEnabled = false;
             }

             stopDide();
            // movovePiece(thisScreenPlayer, 3);
           
            

          
             /*
            
             if ((activePlayer+1) == playerCount)
                 activePlayer = 0;
             else {
                 activePlayer++;
             }
             */

             $.connection.hub.start().done(function () {
                 chat.server.sendClients($('#txtBoardName').val(), thisScreenPlayer, playerstandings[thisScreenPlayer]);
                 chat.server.sendActivePlayerToClient($('#txtBoardName').val(), activePlayer);
             });

            

           //  activePlayer = thisScreenPlayer;
         }


         function showlog() {

             divlog = document.getElementById("divaLog");

            
         }
      
       function  SetActivePlayer(ActivePlayer)
         {
           activePlayer =  parseInt( ActivePlayer[0]);
          // var varbtnRollDice = document.getElementById('btnRollDice');
            
           if (ActivePlayer[2] == $('#HiddenClientID').val()) {
            //   varbtnRollDice.disabled = "enabled";
               document.getElementById("btnRollDice").disabled = false;
           }
           else {
              // varbtnRollDice.disabled = "disabled";
               document.getElementById("btnRollDice").disabled = true;
           }

           $('#txtActivePlayer').val(ActivePlayer[1].toString());
         }
          
         function stopDide() {
             timerEnabled = false;
             var varlblDiceNumber = document.getElementById('lblDiceNumber');
             movovePiece(this.activePlayer, Number(varlblDiceNumber.textContent));

         //    alert(this.playerCount);
          //   alert(this.activePlayer+1);
             if ((this.activePlayer + 1) == this.playerCount)
             {
                 this.activePlayer = 0;
            //     alert(this.activePlayer);
             }
             else {
                 this.activePlayer++;
              //   alert(this.activePlayer);
             }
         }

         function movovePiece(playernumber, number) {
            // var ladderOrSnak = "";
             var currentstandinf = playerstandings[playernumber];
             var targetstanding = currentstandinf + number;
             var TargetParameters = getTargetNumber(currentstandinf + number);
             targetstanding = TargetParameters[0] ;
             if (targetstanding < arrControl.length) {

                   var divdivplayers0 = document.getElementById('players' + playernumber.toString());
                 
                 for (var i = currentstandinf+1; i <= targetstanding; i++) {
                     sleep(300);
                   //  divdivplayers0.style.top = arrControl[i].offsetTop.toString() + 'px';
                   //  divdivplayers0.style.left = arrControl[i].offsetLeft.toString() + 'px';
                   //  divdivplayers0.style.position = 'absolute';;
                     arrControl[i].appendChild(divdivplayers0);
                    // setTimeout(delay(), 1000);

                 }
                 

                 moveaction(playernumber, currentstandinf+1, targetstanding)
                 
                 playerstandings[playernumber] = targetstanding;
                 $.connection.hub.start().done(function () {
                     chat.server.addToLog($('#txtBoardName').val(), $('#txtPlayerName').val(), thisScreenPlayer, number, currentstandinf, currentstandinf + number, targetstanding, TargetParameters[1])
                     chat.server.getLog($('#txtBoardName').val());

                 });
                 }
         }

         function setCurrentPosition(playerNumber, TargetStanding)
         {
         //    alert("Player#:" + playerNumber.toString() +  "TargetStanding " + TargetStanding.toString());
             if (TargetStanding > 0) {
                 var divdivplayers0 = document.getElementById('players' + playerNumber.toString());

                 //for (var i = currentstandinf + 1; i <= targetstanding; i++) {
               //  divdivplayers0.style.top = arrControl[TargetStanding].offsetTop.toString() + 'px';
               //  divdivplayers0.style.left = arrControl[TargetStanding].offsetLeft.toString() + 'px';
               //  divdivplayers0.style.position = 'absolute';;
                 arrControl[TargetStanding].appendChild(divdivplayers0);

             }
         }
         function sleep(milliseconds) {
             const date = Date.now();
             let currentDate = null;
             do {
                 currentDate = Date.now();
             } while (currentDate - date < milliseconds);
         }

         function CreateORJoinGroup(JoinOrCreate)
         {
             var txtGroupNamedivplayers0 = document.getElementById('txtBoardName');
             if (JoinOrCreate == 1) {
                 $.connection.hub.start().done(function () {
                     chat.server.createBoard($('#txtBoardName').val(), $('#txtPlayerName').val(), $('#selNoOFPlayers').val(), $('#HiddenClientID').val());
                     setPlayer();
                   //  SetNumberOfPlayersCount(PlayerCount);
                     //  chat.server.createBoard("txtBoardName", "txtPlayerName");
                 });
             }
             else {
                 $.connection.hub.start().done(function () {
                     chat.server.joinGroup($('#txtBoardName').val(), $('#txtPlayerName').val(), $('#HiddenClientID').val());
                     //  chat.server.createBoard("txtBoardName", "txtPlayerName");
                 });
             }
           //  $.connection.hub.start().done(function () {
           //      chat.server.CreateBoard($('#txtBoardName').val(), thisScreenPlayer, playerstandings[thisScreenPlayer]);
           //  });
         }

         function JoininGroup()
         { }
         function moveaction(playernumber, moveto, targetstanding)
         {
           //  alert("Player #: " + playernumber.toString() + "MoveTo:" + moveto.toString() + "TargetStanding: " + targetstanding.toString());
             var divdivplayers0 = document.getElementById('players' + playernumber.toString());

             //for (var i = currentstandinf + 1; i <= targetstanding; i++) {

             // divdivplayers0.style.top = arrControl[moveto].offsetTop.toString() + 'px';
            // divdivplayers0.style.left = arrControl[moveto].offsetLeft.toString() + 'px';
            //// divdivplayers0.style.position = 'absolute';;
             arrControl[moveto].appendChild(divdivplayers0);
                 //     delay();
             moveto++;
             if (moveto <= targetstanding) {


                 setTimeout(moveaction(playernumber, moveto, targetstanding), 1000);
             }
             //return moveto + 1;
             //}

         }
         function delay() {
             for (var i = 0; i < 5000; i++) {
                 ;
             }
         }



      function   getTargetNumber(inputnumber  ) {
          var returnnumnber;
          var snakeOrLadder;
             //alert(inputnumber.toString());
             switch (inputnumber) {
                 case 19:
                     {
                         returnnumnber = 39;
                         snakeOrLadder = "Ladder";
                         break;
                     }
                 case 16: {
                     returnnumnber = 28;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 30: {
                     returnnumnber = 50;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 41: {
                     returnnumnber = 61;
                     snakeOrLadder = "Ladder";
                     break;
                 }

                 case 52: {
                     returnnumnber = 72;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 63: {
                     returnnumnber = 83;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 65: {
                     returnnumnber = 105;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 74: {
                     returnnumnber = 94;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 79: {
                     returnnumnber = 117;
                     snakeOrLadder = "Ladder";
                     break;
                 }
                 case 87: {
                     returnnumnber = 115;
                     snakeOrLadder = "Ladder";
                     break;
                 }

                 case 111: {
                     returnnumnber = 89;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 113: {
                     returnnumnber = 109;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 119: {
                     returnnumnber = 95;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 106: {
                     returnnumnber = 1;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 121: {
                     returnnumnber = 99;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 97: {
                     returnnumnber = 73;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 75: {
                     returnnumnber = 10;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 59: {
                     returnnumnber = 8;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 55: {
                     returnnumnber = 33;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 47: {
                     returnnumnber = 25;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 43: {
                     returnnumnber = 21;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 case 17: {
                     returnnumnber = 6;
                     snakeOrLadder = "Snake";
                     break;
                 }

                 case 26: {
                     returnnumnber = 3;
                     snakeOrLadder = "Snake";
                     break;
                 }
                 default: {

                     returnnumnber = inputnumber;
                     snakeOrLadder = "None";
                     //  alert(returnnumnber.toString());
                     break;
                 }
             }
             // alert(returnnumnber.toString());
          return [returnnumnber, snakeOrLadder];
         }
     function    movovePiece0(playernumber  ,DiceInputnumber) {

             //  alert(playernumber.toString());
             //  alert(this.playerstandings);
             //  alert(this.playerstandings[playernumber].toString());
             var currentstandinf  = playerstandings[playernumber];
             // alert(currentstandinf.toString());

             var targetstanding=getTargetNumber(currentstandinf + DiceInputnumber);

             // alert(targetstanding.toString());
             // alert(this.arrControl.length);

             if (targetstanding < 133) {
                 // alert('@3');
                 var divdivplayers0 = document.getElementById('players' + playernumber.toString());

                 for (var i = currentstandinf + 1; i <= targetstanding; i++) {
                     this.sleep(300);
                    // divdivplayers0.style.top = (this.arrControl[i].offsetTop + 4).toString() + 'px';
                    // divdivplayers0.style.left = this.arrControl[i].offsetLeft.toString() + 'px';
                    // divdivplayers0.style.position = 'absolute';;

                     this.arrControl[i].appendChild(divdivplayers0);
                     // setTimeout(delay(), 1000);

                 }


                 //   this.moveaction(playernumber, currentstandinf + 1, targetstanding)

                 this.playerstandings[playernumber] = targetstanding;
                 var onpPlaylog  = {
                     PlayerNumber: playernumber + 1,
                     DiceNumber: DiceInputnumber,
                     SnakeorLadder: "none",
                     TargetStanding: currentstandinf + DiceInputnumber,
                     FinalStanding: targetstanding,
                     CurrentStanding: currentstandinf
                 };
                 // alert('0');

                 onpPlaylog.PlayerNumber = playernumber + 1;
                 //  alert('2');
                 onpPlaylog.DiceNumber = DiceInputnumber;
                 //   alert('3');
                 onpPlaylog.SnakeorLadder = "None";
                 //  alert('4');
                 onpPlaylog.TargetStanding = currentstandinf + DiceInputnumber;
                 onpPlaylog.FinalStanding = this.playerstandings[playernumber];
                 //  alert('5');
                 onpPlaylog.CurrentStanding = currentstandinf;
                 //  alert('1');

                 // var varDivLog = document.getElementById('DivLog');
                 // alert('0');
                 this.PlayHistory.push(onpPlaylog);
                 //   alert('1');
             }
         }


         chat.client.playerJoinedMessage = function (JoinCreatedMessage, intPlayerCount, intplayerjoined, PlayerNames, activePlayer)
         {
             $('#lblPlayerJoined').val(JoinCreatedMessage);
             this.playerCount = intPlayerCount;
             SetNumberOfPlayersCount(this.playerCount);
             $('#selNoOFPlayers').val(this.playerCount);
           //  alert(this.playerCount);
          //   alert(intplayerjoined);
             $("#selPlayer option").each(function () {
                 if ($(this).val() == intplayerjoined) {
                     $(this).text(PlayerNames[intplayerjoined]);
                     $(this).attr('selected', 'selected');
                     thisScreenPlayer = intplayerjoined;



                     jQuery.each(PlayerNames, function (index, item) {
                         // do something with `item` (or `this` is also `item` if you like)
                   //      alert("This " + item[2]);
                         if (this[2] == $('#HiddenClientID').val()) {
                             thisScreenPlayer = parseInt(this[0]);
                         }
                     }
                     );

                  //   alert(thisScreenPlayer);
                  //   alert("This screen Player " + PlayerNames[intplayerjoined].toString());
                 }

                 try {
                     $(this).text(PlayerNames[$(this).val()]);
                 }
                 catch
                 {

                 }

             });
             
             setSettings();
             SetActivePlayer(activePlayer);
         }
 
         
         chat.client.setPlayersLocation = function (Rplayerstandings2) {
                
           //  setCurrentPosition(playerNumber, TargetStanding)
             setCurrentPosition(0, Rplayerstandings2[0]);
             setCurrentPosition(1, Rplayerstandings2[1]);
             setCurrentPosition(2, Rplayerstandings2[2]);
             setCurrentPosition(3, Rplayerstandings2[3]);
             setCurrentPosition(4, Rplayerstandings2[4]);

             };
             
         $.connection.hub.start();
       /*    
         $.connection.hub.start().done(function () {
             $('#sendmessage').click(function () {
                 // Call the Send method on the hub. 
                 chat.server.send($('#displayname').val(), $('#message').val());
                 // Clear text box and reset focus for next comment. 
                 $('#message').val('').focus();
             });
         });
         */

         chat.client.setActivePlayer = function (ActivePlayer) {
             SetActivePlayer(ActivePlayer);
         }

         chat.client.setNumberOfPlayersCount = function (numberofPlayers) {
             SetNumberOfPlayersCount(numberofPlayers);
         }

         chat.client.displayLog = function (logfromclient) {

             var divdivplayers0 = document.getElementById('divaLog');
             divdivplayers0.innerHTML = logfromclient;
          //   $('#txtaLog').val(logfromclient); 
         }

         chat.client.disconnectClient = function () {
             $.connection.hub.stop();
             alert('disconnected');
         }

         function setSettings() {
            
             document.getElementById('diveSettings').style.display = 'none';
             document.getElementById('divBoard').style.display = '';
           
         }

         function btn_DisplayLog() {
             document.getElementById('divLog').style.display = '';
         }
         function btn_HideLog() {
             document.getElementById('divLog').style.display = 'none';
         }


         setBoard();

         
     </script>

</asp:Content>
