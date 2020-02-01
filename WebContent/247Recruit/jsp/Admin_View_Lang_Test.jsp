<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
  <head>
  
  <%
  	Connection con = null;
	Statement stmt = null;
	String langTestId = request.getParameter("langTestId");	
  
  	ResultSet rs = null;
	ResultSet rsCount = null;
	int qsCount = 0;
	PreparedStatement Pst = null;
	String Lang_Test_ID = "";
	String Lang_Passage = "";
	String PartA_Header = "";
	String PartA_Part1_Header = "";
	String PartA_Part2_Header = "";
	String PartB_Header = "";
	String PartB_Q = "";
	String PartC_Header = "";
	String PartC_Q1 = "";
	String PartC_Q2 = "";
	String PartC_Q3 = "";
	PreparedStatement ps = null;
  
   %>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->

	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>
	<script type="text/javascript">
	function displayStartTest()
	{
		document.getElementById("displayQuestion").style.display="";
		document.getElementById("startTest").style.display="none";
		LanguageTest();
	}
	</script>	
	<style type="text/css">
	.theader 
	{
	    background: url("/springboard/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
	    color: #FFFFFF;
	}
	</style>

<script type="text/javascript">
function textvalidate()
{		
 	submitform();
}
</script>

<script type="text/javascript">
function submitform()
{		
	document.getElementById("Submit").style.display="none";
	document.getElementById("processing").style.display="";
	document.forms[0].submit();
}
</script>	

<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
 		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			alert("Invalid character entered !!");
			return false;
		}
	}      
</script>



<script type="text/javascript">
function startProcess()
{
	alert('inside startProcess');
	Document.getElementById('Submit').style.display = 'none';
	Document.getElementById('processing').style.display = '';
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
</head> 
<%
try
{
	con = ConnectDatabase.getConnection();
	String getLanguagePA = "SELECT * FROM language_test_master where lang_test_id = "+langTestId; //  
	System.out.println("getLanguagePA  : " + getLanguagePA);
	stmt = con.createStatement();
	rs = stmt.executeQuery(getLanguagePA);
	if(rs.next())
	{
		
		Lang_Test_ID = rs.getString("Lang_Test_Id");
		PartA_Header = rs.getString("PartA_Header");
		Lang_Passage = rs.getString("Lang_Passage");

		// PART A
		PartA_Part1_Header = rs.getString("PartA_Part1_Header");
		PartA_Part2_Header = rs.getString("PartA_Part2_Header");
		
		// PART B
		PartB_Header = rs.getString("PartB_Header");
		PartB_Q = rs.getString("PartB_Q");
		
		// PART C
		PartB_Header = rs.getString("PartB_Header");
		PartB_Q = rs.getString("PartB_Q");
		PartC_Header = rs.getString("PartC_Header");
		PartC_Q1 = rs.getString("PartC_Q1");
		PartC_Q2 = rs.getString("PartC_Q2");
		PartC_Q3 = rs.getString("PartC_Q3");		
	}
%>
 
  <body>
  <form action="<%=request.getContextPath()%>/LanguageTest" name="LanguageTest" id="LanguageTest" method="post" autocomplete="off">
  <table border="0" width="100%">
	<tr>
	<td colspan="2" align="center">
<!--******************************************************* START TAB CODE ****************************************************************** --> 
	<div class="demo" style="width: 700px;">
		<table>	
			<tr>
				<td class="theader" height="32px;">
					<div style="float: left; font-size: 13px; font-weight: bold; font: Verdana,Arial,sans-serif; padding-left: 5px;" >
						Read the below passage and answer Part A, Part B and Part C
					</div>
					<div style="float: right;font-size: 13px; font-weight: bold; Verdana,Arial,sans-serif;">
						Time Remaining
						<input id="disp" value="45:00" type="text" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;" size="5" readonly="readonly" name="disp"/>
					</div>				
				</td>
			</tr>
			<tr>
				<td align="center">
					<textarea disabled="disabled" class="quest_output" id="passage" style=" color:black; resize: none; width: 700px; height: 200px; overflow-x: hidden; background-color: white; text-align: justify;" readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"><%=Lang_Passage%></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					
<div id="displayQuestion" style="width: 700px;">
<div class="demo" style="width: 700px; padding-top: 5px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
<div id="tabs">
	<ul>
		<li><a href="#tabs-1"><b>Part A</b></a></li>
		<li><a href="#tabs-2"><b>Part B</b></a></li>
		<li><a href="#tabs-3"><b>Part C</b></a></li>
	</ul>
	<!-- ==================================     START  tabs-2 Language PArt A       ==================================        -->
	<div id="tabs-1">
				<table border="0" style="width: 100%;">
				<%
				boolean fPart2 = false;
				for(int i = 1;i<11;i++)
				{
					if(i==1)
					{
					%>
					<tr>						
						<td colspan="3" nowrap="nowrap" style="font-weight: bold; font-size: 12px;">
							<%=PartA_Header%>
						</td>
					</tr>
					<tr>						
						<td colspan="3" nowrap="nowrap" style="font-weight: bold; font-size: 12px;">
							<%=PartA_Part1_Header %>
						</td>
					</tr>
					<tr>
						<td><%=rs.getString("PartA_Q1") %></td>
						<td align="left"><input type="text" disabled="disabled" name="partA1" id="partA1" maxlength="50" onkeypress="return AllowChars(event);"/></td>
						<td></td>
					</tr>
					<%
					}
					else
					{	
						String tempPartA_Part = rs.getString("PartA_Q"+i+"_Part");
						if(tempPartA_Part.equals("1"))
						{
					%>
					<tr>
						<td><%=rs.getString("PartA_Q"+i) %></td>
						<td align="left"><input type="text" disabled="disabled" name="partA<%=i%>" id="partA<%=i%>" maxlength="50" onkeypress="return AllowChars(event);"/></td>
						<td></td>
					</tr>
					<%
						}
						else
						{
							if(fPart2 == true)
							{
					%>
					<tr>
						<td colspan="3" nowrap="nowrap"><%=rs.getString("PartA_Q"+i) %>	</td>
					</tr>
					<tr>
						<td colspan="3" nowrap="nowrap">
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="True" disabled="disabled"/> True 
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="False" disabled="disabled"/> False
						</td>			
					</tr>
					<%
							}
							else
							{
								fPart2 = true;
					%>
					<tr>
						<td colspan="3" style="height: 10px;">
							<input type="hidden" name="countPart1" value="<%=i-1%>"/>
							<input type="hidden" name="LangTestID" value="<%=Lang_Test_ID%>"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bold; font-size: 12px;">
							<%=PartA_Part2_Header %>
						</td>
					</tr>
					<tr>
						<td colspan="3" ><%=rs.getString("PartA_Q"+i) %></td>
					</tr>
					<tr>
						<td colspan="3" nowrap="nowrap">
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="True" disabled="disabled"/> True 
							<input type="radio" name="truFalse<%=i%>" id="truFalse<%=i%>" value="False" disabled="disabled"/> False
						</td>						
					</tr>
					<%
							}
						}
					}
				}
					%>
			</table>
	</div>
	<!-- ==================================     END    tabs-2 Language PArt A       ==================================        -->

	<!-- ==================================     START  tabs-3 Language PArt B       ==================================        -->
	<div id="tabs-2">
		<table>
			<%if(PartB_Header!=null){ %>
			<tr>
				<td align="left" style="font-weight: bold; font-size: 12px;">
				<%=PartB_Header %>
				</td>
			</tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
			<tr>
				<td align="left">
				<%=PartB_Q %>
				</td>
			</tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
			<tr>
				<td><textarea name="partBQ" disabled="disabled" id="partBQ" style="resize: none; width: 660px; height: 150px; text-align: left;" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td>
			</tr>
			<%} %>

		</table>
	</div>
	<!-- ==================================     END  tabs-3 Language PArt B       ==================================        -->


	<!-- ==================================     START  tabs-4 Language PArt C       ==================================        -->
	<div id="tabs-3">
	
<table>

	<%if(PartC_Header!= null){ %>
	<tr>
		<td align="left" style="font-weight: bold; font-size: 12px;">
		<%= PartC_Header%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q1 != null){ %>
	<tr>
		<td>
		<%= PartC_Q1%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q2 != null){ %>
	<tr>
		<td>
		<%= PartC_Q2%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td>
		<%= PartC_Q3%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td><textarea name="partCQ" disabled="disabled" id="partCQ" style="resize: none; width: 660px; height: 150px; text-align: left;" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td>
	</tr>
	<%} %>
</table>
</div>
	<!-- ==================================     END  tabs-4 Language PArt C       ==================================        -->

</div>
<!--******************************************************* End TAB CODE ****************************************************************** -->
				</td>
			</tr>		
		</table>
	</div>
   </td>
	</tr>
</table>
</form>

<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->

  </body>
<%
}

catch(Exception e)
{
	e.printStackTrace();
	// response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
 %>  
</html>
