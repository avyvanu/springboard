<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<% String USER_Name =((String)session.getAttribute("USER_Name")).trim();
System.out.println("USER_Name==="+USER_Name);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 Online Test</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>
<style type="text/css">

html,body
	
	{
	
	margin: 0px;
	
	}

 
.contentSize

	{
	
	clear: both;
	
	display: block;
	
	overflow: hidden;
	
	padding: 6px 4px;
	
	width: 750px;
	
	
	}

.wrapper

	{
	
	margin: 0 auto;
	
	width: 750px;
	} 
.tPersonal

	{
	
	width: 550px;
	
	height: 300px;
	
	
	} 
</style>
 
 
 <script language="javascript">
shortcut.add("F5",function(){
alert("you pressed F5!");
<%
    if(session.getAttribute("ip") != null)
    {
	%>	
	    top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
	<%
	}
	else
	{
	%>	
		top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
	<%
	}
%>
});


shortcut.add("Alt+Left",function(){alert("you pressed Alt+Left!");
<%
 if(session.getAttribute("ip") != null){
%>
	top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
<%
}
else
{
%>
	top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
<%
}
%>
});
</script>
 
 
 <script type="text/javascript" language="javascript">

 function logout()
	 {
	 location.href = "<%=logoutPage%>";
	 }
</script>


 <!--  Timer script -->
<script LANGUAGE="JavaScript">
  
		var mins
		var secs;

		function cd() {
		 	mins = 1 * m("20"); // change minutes here
		 	secs = 0 + s(":00"); // change seconds here (always add an additional second to your total)
		 	redo();
		}
		
		function m(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(0, i));
		}
		
		function s(obj) {
		 	for(var i = 0; i < obj.length; i++) {
		  		if(obj.substring(i, i + 1) == ":")
		  		break;
		 	}
		 	return(obj.substring(i + 1, obj.length));
		}
		
		function dis(mins,secs) {
		 	var disp;
		 	if(mins <= 9) {
		  		disp = " 0";
		 	} else {
		  		disp = " ";
		 	}
		 	disp += mins + ":";
		 	if(secs <= 9) {
		  		disp += "0" + secs;
		 	} else {
		  		disp += secs;
		 	}
		 	return(disp);
		}
		
		function redo() {
	 	secs--;
	 	if(secs == -1) {
	  		secs = 59;
	  		mins--;
	 	}
	 	document.cd.disp.value = dis(mins,secs); // setup additional displays here.
	 	if((mins == 0) && (secs == 0)) {
	 	
	  		window.alert("Time is up. Press ok."); // change timeout message as required
	  		<% if(session.getAttribute("ip") != null){%>
           validateText12();
           <%}%>
	      submitform();
	  		// window.location = "precis_success_test" // redirects to specified page once timer ends and ok button is pressed
	 	} else {
	 		cd = setTimeout("redo()",1000);
	 	} 
		}
		function submitform()
		{
		
		document.getElementById("Submit").style.display="none";
		document.getElementById("processing").style.display="";
		document.forms[0].submit();
		}
		function init() 
		{
		  cd();
		}
		// window.onload = init;
		
		</script>


<!-- Script for Word Count -->
<script type="text/javascript">

	   function cnt(w,x)
		    {
		    var y=w.value;
		    var r = 0;
			a=y.replace(/\s/g,' ');
			// alert( 'hello' +a);
			a=a.split(' ');
			aa=a.length;               
			if(aa!=61)
			{
				for (z=0; z<a.length; z++) 
				{
					if (a[z].length > 0)
					r++;
				}
				
			}
			else
			{
				//alert('You Entered 60 words. Please Click Finish !');
		     // submitform();
			}
			x.value=r;
		} 
</script>

<SCRIPT LANGUAGE="JavaScript1.1">
<!--

//Disable right mouse click Script
//By Maximus (maximus@nsimail.com) w/ mods by DynamicDrive
//For full source code, visit http://www.dynamicdrive.com-->

var message="Mouse Right Click Disabled!";

		function clickIE4(){
		if (event.button==2){
		alert(message);
		return false;
		}
		}
		
		function clickNS4(e){
		if (document.layers||document.getElementById&&!document.all){
		if (e.which==2||e.which==3){
		alert(message);
		return false;
		}
		}
		}
		
		if (document.layers){
		document.captureEvents(Event.MOUSEDOWN);
		document.onmousedown=clickNS4;
		}
		else if (document.all&&!document.getElementById){
		document.onmousedown=clickIE4;
		}
		
		document.oncontextmenu=new Function("alert(message);return false")
</script>

<!-- Validate the User input field blank or not -->

<script type="text/javascript">
		function textvalidate()
		{
		var textval = document.getElementById("w").value;
		if(textval==null || textval=='' || textval==0)
		{
		alert("Please Enter Some Text");
		document.getElementById('w').focus();
		return false;
		}
		else
		{
		
		 <% if(session.getAttribute("ip") != null){%>
           validateText12();
           <%}%>
           submitform();
		}
		}
</script>

<script type="text/javascript">
function validateText12()
	{
		
		parent.parent.related.document.getElementById("test_flag").value="4";
		parent.parent.related.webcam.capture();
	}
</script>

<!-- Cop Paste Script -->
<script type="text/javascript">
		function nocopypaste(e)
		{
		var code = (document.all) ? event.keyCode:e.which;
		
		var msg = "Sorry, this functionality is disabled.";
		if (parseInt(code)==17) //CTRL
		{
		alert(msg);
		window.event.returnValue = false;
		}
		}
</script>

<script language="javascript">
        shortcut.add("F5",function(){alert("you pressed F5!"); });
		shortcut.add("Ctrl+V",function(){alert("Sorry you don't have permission to paste any content!"); });
		shortcut.add("Alt+Left",function(){alert("You pressed Alt+Left!"); });
</script>
<script type="text/javascript">
window.history.forward(1); 
</script>
<script type="text/javascript">

function displayStartTest()
{	
	document.getElementById("displayTextArea").style.display="";
	cd();
	document.getElementById('w').focus();
	document.getElementById("hiddenTableStartTest").style.display="none";  	
}
</script>

</head>
		<body>
		<table border="0" width="100%">
		<tr>
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > Chat Process Tests  ></font>
		<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Precis Writing Test</font>
		</td>
		<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
		</tr>
		</table><br/>
          <%
				try
				{
				        Connection con = ConnectDatabase.getConnection(); 
				        String candID=null;
				        String candidatefirstname=null;
				        String candidatelastname=null;
		                int id=0;
		                //String sessionid="IC00000001";  
		                int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
		                String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where AutoID='"+USER_AUTOID+"'";
						System.out.println("query "+secQsnxQry7);
						Statement stmts = con.createStatement();
						ResultSet rss = stmts.executeQuery(secQsnxQry7);
						while(rss.next())
						{
						id=rss.getInt("AutoID");
						candID=rss.getString("Bpo_Cand_Id");
						candidatefirstname=rss.getString("First_Name");
						candidatelastname=rss.getString("Middle_Name");
						}
						PreparedStatement Pst =con.prepareStatement("Insert into precis_test_attempt_master(user_id,start_date) VALUES("+USER_AUTOID+",sysdate())");
                        Pst.executeUpdate();
			            System.out.println(Pst);
		                 %>
	
<form name="cd" action="<%=request.getContextPath()%>/PrecisWritingTest" method="post" id="preciswritingsubmitform" name="preciswritingsubmitform" method="post"  >
		<div class="wrapper">

<div class="contentSize"> 
		
		<input type="hidden" name="candidateautoid" value="<%=USER_AUTOID %>"/>
		<input type="hidden" name="candidategeneratedid" value="<%=candID %>"/>
               <%  
                    int countPassages=0; 
	                String secqrycountpassage = "select count(*) as count from precis_writing_passages_master";
					System.out.println("query "+secqrycountpassage);
					Statement stmtsrecpassagecount = con.createStatement();
					ResultSet rssrecpassagecount = stmtsrecpassagecount.executeQuery(secqrycountpassage);
					if(rssrecpassagecount.next())
					{
					countPassages=rssrecpassagecount.getInt("count");
					System.out.println("countPassages:::::"+countPassages);
				    }
                    rssrecpassagecount.close();
                    stmtsrecpassagecount.close();
                     Random rand = new Random();
	                 int num = rand.nextInt(countPassages);
	                 System.out.print("Random Value of Precis Writing Passage:::::"+num);
	                 if(num==0)
	                  {
	                  	num=1;
	                  }

				
	                String typopara=null; 
	                String secqrypassage = "select * from precis_writing_passages_master where precis_passage_id="+num;
					System.out.println("query "+secqrypassage);
					Statement stmtsrecpassage = con.createStatement();
					ResultSet rssrecpassage = stmtsrecpassage.executeQuery(secqrypassage);
					if(rssrecpassage.next())
					{
					typopara=rssrecpassage.getString("Precis_Writing_Passage");
				    } 
				%>
<table width="100%" cellspacing="5px">   
		  
		    <tr align="left" style="color:white;">
						<th colspan="2" width="1" height="32" style="background-image:url(<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg);">
						<div style="float:left;padding-left: 5px"> Precis Writing Test </div>	
						</th>
					</tr>
		  <tr>
		
		  <td>      
	  <input type="hidden" value="<%=num%>" name="typeid"/>  
	  <div onmousedown="return false">    
<textarea id="passage" style="width:100%;height:200px;font-size:12px;font-weight:bold;font-family: arial; background-color:#F2F2F2;resize:none;border-left: #F2F2F2;border-right: #F2F2F2; border-top: #F2F2F2;border-right: #F2F2F2" readonly="readonly" ondrop="return false;" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false">
<%= typopara%>
</textarea>
</div>
		</td>
		</tr>
</table>
<div style="display: none;" id="displayTextArea">
<table width="100%" height="80px" border="0" cellspacing="5px">
		 <tr>
		 <td width="15%" height="50px"  align="center" bgcolor="#D8D8D8"> <b>Count of Words</b> </td>
		 <td width="85%" rowspan="2">
			<textarea  name="w"  id="w" style="width:100%;height:80px;background-color: #F7F7F7;resize:none;" onKeyUp="cnt(this,document.cd.c)"  onKeyDown="return nocopypaste(event)" onclick="init();" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
         </td>
		 </tr>
		 <tr> 
		 <td height="30px" class="allBackColor" align="center"><input type="text" name="c"  readonly="readonly"  size="1" onKeyUp="cnt(document.cd.w,this)" width="100%" style="font-family:sans-serif;font-size:13pt;font-weight: bold;border:none;text-align: center;background-color: #F2F2F2;"/></td>
		  </tr>
</table>
<table width="100%" height="40px" cellspacing="5px" >
		<tr>
		<td width="15%" height="100%"  rowspan="2" bgcolor="#D8D8D8" align="center"><b>Elapsed Time</b></td>
		<td width="10%" height="20px" bgcolor="#f38901" style="color: white;text-align: center"><b>count down</b></td>
		</tr>
		<tr>
		<td width="10%" height="20px" class="allBackColor" ><input id="txt" readonly="readonly" type="text" value="10:00" border="none" name="disp" size="7pt" style="font-family:sans-serif;font-size:13pt;font-weight: bold;background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"></td>
		<td width="537" align="right">  <input name="Submit" id="Submit" type="submit" value="Finish"  class="buttonSmall" onclick="return textvalidate();"/> <span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2">Processing..</font></b></span></td>
		</tr>
</table>
</div>
<div  id="hiddenTableStartTest">
<table width="100%" height="40px" cellspacing="5px">
	<tr  bgcolor="#f7f7f7">
		<td align="right">
			<input name="startTest" id="startTest" type="button" value="Start Test"  class="buttonMedium" onclick="return displayStartTest();"/>
		</td>
	</tr>
</table>
 </div>
              <%
	                rssrecpassage.close();
					stmtsrecpassage.close();
					rss.close();
					stmts.close();
					con.close();
					}
					catch(Exception ex)
					{
						System.out.println("========="+ex.getMessage());
						ex.printStackTrace();
					}
			 %>
<script type="text/javascript">

			function disableSelection(target){
			if (typeof target.onselectstart!="undefined") //IE route
				target.onselectstart=function(){return false}
			else if (typeof target.style.MozUserSelect!="undefined") //Firefox route
				target.style.MozUserSelect="none"
			else //All other route (ie: Opera)
				target.onmousedown=function(){return false}
			target.style.cursor = "default"
			}
			

</script>

<script type="text/javascript">
			var somediv=document.getElementById("passage")
			disableSelection(somediv) //disable text selection within DIV with id="mydiv"
</script>
</div>
</div>
</form>

	    

  </body>
</html>
