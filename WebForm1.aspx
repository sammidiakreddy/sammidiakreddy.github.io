<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ParamaPadaSophanamM.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
            .grid-container {
        display:grid;
        grid-gap:0px;
        /*grid-gap:2px;*/
      /*  background-color:red;*/
       /* grid-column-start:1;
        grid-column-end:11;*/
    /*   grid-template-columns: auto auto auto auto auto auto auto auto auto auto auto; */
          width:455px;
            height:436px;
            background-color: red;
            background-image:url("ParamaPada.jpg");
            background-size:auto;
            background-repeat:no-repeat;
            
       }
</style>
    <script type="text/javascript">
        function move() {
            var lbla = document.getElementById("labid");
            var lbla1 = document.getElementById("labid1");
            var lbla2 = document.getElementById("labid2");
            var b = document.getElementById("100");
            

          //  lbla.style.top = b.offsetTop.toString() + 'px';
         //   lbla.style.left = b.offsetLeft.toString() + 'px';
          //  lbla.style.position = 'absolute';;
            b.appendChild(lbla1);
            b.appendChild(lbla2);
            b.appendChild(lbla);

        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div  id ="divhd" runat="server" class="grid-container-">

        </div>
        <label id="labid">t</label><label id="labid1">t1</label><label id="labid2">t2</label>
        <input type="button" id="btnMove" value="move" onclick="javascript: move();" />

    </form>
    
</body>
</html>
