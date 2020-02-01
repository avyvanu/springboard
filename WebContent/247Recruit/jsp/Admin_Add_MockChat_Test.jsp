<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>

<html>
	<head>
		<title>[24]7 SPRINGBOARD</title>

	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/CalendarDisplay2.js"></script>
	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/tabledeleterow-calendar.js"></script>	

	<style type="text/css">
	html,body,form
	{
		margin: 0px;
	}
	.theader 
	{
	    background: url("<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
	    color: #FFFFFF;
	}
	.classlangTestleft_TD
	{
		width: 100px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classlangTestleft_TDDYNA
	{
		width: 139px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classlangTestright_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	
	.classlangTestright_JS
	{
		width: 300px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.reSizeforOther
	{
		width: 100%;
	}
	.setBgStyple
	{
		resize: none; 
		width: 660px; 
		height: 150px; 
		text-align: left; 
		background-color:#f8f8f8; 
		border-bottom-color: gray;	

		border-right-color: gray;	
	}
	.delImg
	{
		background-color:#F8F8F8;
		valign:middle;
	}
	.srcvis

{ 

background: url('<%=request.getContextPath()%>/247Recruit/images/delO.png') no-repeat; 

border-style: none;

cursor: pointer;

cursor: hand;

width:16px;

height:16px;
font-weight: bold;
font-size: 11px;

padding-right: 7px;

font-weight: bold;

vertical-align: text-bottom;

text-align: center;

}
	</style>
	<script type="text/javascript">
		function ShowDoc(Filepath)
		{
			someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		}
	</script>
	<script type="text/javascript">
		function AllowChars(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
	        if (charCode == 13) 
	        {
				return false;
			}
		}      
	</script>
	
	<script type="text/javascript">
	var chatQuesCount = 0;
	function chkLangValidation()
	{	
		var dynQues = document.getElementById('total_box').value;		
		var tname = document.getElementById('TestName').value;
		if(tname == null || tname == '' || tname.trim().length == 0)
		{
			alert('Please enter test name !');
			document.getElementById('TestName').focus();
			return false;
		}
		
/*		var mockTest0 = document.getElementById('mockTest0').value;
		if(mockTest0 == null || mockTest0 == '' || mockTest0.trim().length == 0)
		{
			alert('Please complete all the fields !');
			document.getElementById('mockTest0').focus();
			return false;
		}
*/		
		 var total_box = document.getElementById('total_box').value;
		 for (var i=1; i<=parseInt(total_box); i++)
		 {
			
			var mockTest = document.getElementById('mockTest'+i).value;
			if (mockTest == null || mockTest == "" )
			{
			 	 alert('Please Enter the question '+i+' .');		 
			 	 document.getElementById('mockTest'+i).focus();
			 	 return false;
			}
		 }
		 
		document.getElementById('mockAddQues').style.display = 'none';
		document.getElementById('mockChatView').style.display = '';
		
		for (var i=0; i<parseInt(total_box); i++)
		{
			document.getElementById('ques'+i).style.display = '';
			document.getElementById('ans'+i).style.display = '';
			document.getElementById('quesText'+i).innerHTML = document.getElementById('mockTest'+(i+1)).value;
		}

	}
	function edit()
	{
		document.getElementById('mockChatView').style.display = 'none';
		document.getElementById('mockAddQues').style.display = '';
		for(var i = 1; i <= parseInt(document.getElementById('total_box').value); i++)
		{
			document.getElementById('ques'+i).style.display = 'none';
			document.getElementById('ans'+i).style.display = 'none';
		}
		
		
	}
</script>
<script type="text/javascript">
	function ConfirmSubmit()
	{
		if(confirm('Are you sure you want to add this test? It will be available to candidates immediately.'))
		{
			return true;			
		}
		else 
		{
			return false;
		}
	}
</script>


		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">

	</head>

	<body>
	
		<%
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			
			
			try
			{
			con = ConnectDatabase.getConnection();
			String USER_Name = null;
		  	String User_Type_Id = null;
		  	try
		  	{
		  	USER_Name =(String)session.getAttribute("USER_Name");
		  	if(USER_Name == null)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
		  	User_Type_Id = (String)session.getAttribute("User_Type_Id");
		     if(User_Type_Id == null)
			  	{
			  	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			  	}
			 }
			 catch(Exception e)
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			} 		
	%>
	 	
	
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td align="left">
					<img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
				</td>
				<td align="right">
					<img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
				</td>
			</tr>
			<tr class="tBackColor">
				<td align="left" colspan="2" style="height: 12px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px;">
					<font
						style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > 

					</font>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">
						Administration 
						</a>  > 
					</font>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Admin_Disp_MockChatTest.jsp">
						Manage MockChat Test 
						</a> >
					</font>
				
					<font class="nonLink">Add</font>
				</td>
				<td align="right" style="padding-right: 10px;">
					<b><span class="recName"><%=USER_Name%></span>
					</b><font
						style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor: hand; cursor: pointer;">Logout</a>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="top">
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
					<br />
							
			<form action="<%=request.getContextPath()%>/AddChatQuestion" method="post" autocomplete="off">
		 	<div id="mockAddQues">
		 		<%
		 		Object oj = request.getAttribute("NODATE");
		 		if(oj!=null)
		 		{
		 			if(oj.equals("ONE"))
		 			{
		 		%>
		 			<p style="color: red; font-weight: bold; font-size: 12px;"> Please add at least one question !</p>
		 		<%
		 			}
		 		}
		 		 %>
				<table width="900px" border="0" cellpadding="6" cellspacing="6">
				
				
				<tr>
	        		<th class="classlangTestleft_TD" colspan="4">Add New Mock Chat Test</th>
	        	</tr>
	        	<tr>
	        		<td class="classlangTestleft_TD">Test Name</td>
	        		<td class="classlangTestright_TD" colspan="3">
	        		<div id="TestNameDiv">
	        			<input type="text" class="reSizeforOther" id="TestName" name="TestName" onkeypress="return AllowChars(event);">
					</div>
	        		</td>
	        	</tr>
	        	
	        	<tr>
	        		<td class="classlangTestleft_TD">Chat Type</td>
	        		<td class="classlangTestright_TD">
   						<select name="chatProcess" id="chatProcess" class="reSizeforOther">
			            <option value="0" selected="selected">NA</option>
						<%
								String qry = "SELECT Skill_type_Id, Skill_type_Name FROM skill_type_master WHERE is_Active=1";
								System.out.println("query "+qry);
								st = con.createStatement();
								rs = st.executeQuery(qry);
								while(rs.next())
								{
								%>
									<option value="<%=rs.getString("Skill_type_Id")%>"><%=rs.getString("Skill_type_Name")%></option>	
						    	<%
								}
								rs.close();
			            %>
					</select>
	        		</td>
	        		<td class="classlangTestleft_TD">Number of Questions</td>
	        		<td class="classlangTestright_TD">
						<div id="PartAPart1QCountDIV">
							1
						</div>
					</td>
	        	</tr>
	        	
			 </table>

			<table width="900px" border="0" cellpadding="6" cellspacing="6"  id="tblSample">
				<input type="hidden" name="total_box" id="total_box"/>
				<thead></thead>
				<tbody></tbody>
			</table>

			<table width="900px" border="0" cellpadding="6" cellspacing="6">
				<tr>
					<td align="right">
						<input type="button" class="buttonMedium" onclick="addRowToTable();" value="Add">
					</td>
				</tr>
			</table>

			<hr style="width:890px; height: 1px;">
			<table width="900px" border="0" cellpadding="6" cellspacing="6" id="tblSample">
				<tr id="Addbutton">
					<td colspan="4" align="center">
						<div align="center">		
							<input type="button" name="Preview"  value="Preview" class="buttonMedium" onclick="return chkLangValidation();"/>
						</div>					
					</td>
				</tr>   	 		
			</table>
		</div>		
	 	<div style="display: none;" id="mockChatView">
		<div style="height: 10px;">
		</div>
		<div class="wrapper">
			<div class="inner-content">
				<div class="invalid-log-alert"></div>
					<table style="width:700px;">
						<tr>
							<th colspan="4" width="1" height="32" class="theader"><div style="float:left;padding-left: 5px; font-size: 14px; font-family: Arial,Helvetica,sans-serif;">
								Mok Chat Test Assessment  </div><div style="float:right;"><div style="float:right;  font-size: 14px;">Time Remaining <input type="text" name="disp" id="disp" readonly="readonly" size="5" value="10:00" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;"/> </div></div>
							</th>
						</tr>
					</table>
					<div class="forms">
						<input type="hidden" name="transcriptdump" id="transcriptdump"/>
						<input type="hidden" name="AutoScriptID" value=""/>
						<table border="0">
							<tr>
								<td colspan="4">
									<div class="quest_input_new" id="chatwindow"  align="left">
																  				
									    <div  style="font-size: 12px; display: none;" id="ques0">
									    	<B>:: Customer ::<span id="quesText0"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans0">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques1">
									    	<B>:: Customer ::<span id="quesText1"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans1">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques2">
									    	<B>:: Customer ::<span id="quesText2"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans2">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques3">
									    	<B>:: Customer ::<span id="quesText3"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans3">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques4">
									    	<B>:: Customer ::<span id="quesText4"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans4">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques5">
									    	<B>:: Customer ::<span id="quesText5"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans5">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques6">
									    	<B>:: Customer ::<span id="quesText6"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans6">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques7">
									    	<B>:: Customer ::<span id="quesText7"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans7">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques8">
									    	<B>:: Customer ::<span id="quesText8"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans8">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques9">
									    	<B>:: Customer ::<span id="quesText9"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans9">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques10">
									    	<B>:: Customer ::<span id="quesText10"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans10">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques11">
									    	<B>:: Customer ::<span id="quesText11"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans11">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques12">
									    	<B>:: Customer ::<span id="quesText12"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans12">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques13">
									    	<B>:: Customer ::<span id="quesText13"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans13">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques14">
									    	<B>:: Customer ::<span id="quesText14"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans14">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques15">
									    	<B>:: Customer ::<span id="quesText15"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans15">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques16">
									    	<B>:: Customer ::<span id="quesText16"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans16">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									     <div  style="font-size: 12px; display: none;" id="ques17">
									    	<B>:: Customer ::<span id="quesText17"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans17">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques18">
									    	<B>:: Customer ::<span id="quesText18"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans18">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques19">
									    	<B>:: Customer ::<span id="quesText19"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans19">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques20">
									    	<B>:: Customer ::<span id="quesText20"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans20">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									   
									   									   
									    <div  style="font-size: 12px; display: none;" id="ques21">
									    	<B>:: Customer ::<span id="quesText21"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans21">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques22">
									    	<B>:: Customer ::<span id="quesText22"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans22">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques23">
									    	<B>:: Customer ::<span id="quesText23"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans23">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									    <div  style="font-size: 12px; display: none;" id="ques24">
									    	<B>:: Customer ::<span id="quesText24"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans24">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques25">
									    	<B>:: Customer ::<span id="quesText25"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans25">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    <div  style="font-size: 12px; display: none;" id="ques26">
									    	<B>:: Customer ::<span id="quesText26"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans26">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									     <div  style="font-size: 12px; display: none;" id="ques27">
									    	<B>:: Customer ::<span id="quesText27"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans27">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques28">
									    	<B>:: Customer ::<span id="quesText28"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans28">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques29">
									    	<B>:: Customer ::<span id="quesText29"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans29">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									    
									     <div  style="font-size: 12px; display: none;" id="ques30">
									    	<B>:: Customer ::<span id="quesText30"></span></B>								    
									    </div>									    
									    <div style="color: red; font-size: 12px;display: none;" id="ans30">
									    	<b>:: Candidate Name ::</b> < Response > 
									    </div>
									    
									</div>
								</td>
							</tr>
						</table>
					</div>
					<input type="hidden" name="hidMin" id="hidMin" value="" />
  					<input type="hidden" name="hidSec" id="hidSec" value="" />
					<table>
					<tr>
						<td colspan="4">
							<div>
								<textarea disabled="disabled"  id="CHAT2" style="color: red; font-size: 10px;  width: 688px; overflow: auto; background-color:#FFFFFF; border:1px solid #9BB168; font-family:Verdana,Arial,sans-serif; color:#000000; height:50px;resize:none;padding: 4px;" name="CHAT2"  onkeypress="return isEnterKey(event);" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div style="float: right;">
								<input type="button" value="Send" id="submit" class="buttonSmall" name="submit" onclick="return textvalidate(), focusset()" disabled="disabled" style="cursor:default;"/>
								
							</div>
						</td>
					</tr>
					<tr style="background-color: #f8f8f8;">
						<td align="left">
							<div style="float: left;">
								<input type="button" value="Edit" id="Edit" class="buttonSmall" name="submit" onclick="return edit();"/>
								
							</div>
						</td>
						<td align="right">
							<div style="float: right;">
								<input type="submit" value="Confirm" id="Confirm" class="buttonSmall" name="submit" onclick="return ConfirmSubmit();"/>								
							</div>
						</td>
					</tr>
				  </table>
				</form>
		
<br/>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->				
				</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 10px;"></td>
			</tr>
			 <tr class="footerBackColor" >
	       <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						  <%
						   }
						   %>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
							<%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						  <%
						   }
						   %>
						   
						</td>
					</tr>
				</table>
			</td>
	    </tr>
		</table>
		<%
		}
		catch(NullPointerException nullPoint)
		{
		 	System.out.println("nullPoint \t"+nullPoint);
		 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		 %>
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
</html>

