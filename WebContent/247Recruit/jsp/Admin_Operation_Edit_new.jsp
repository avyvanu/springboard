<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>

<html>
	<head>
		<title>[24]7 SPRINGBOARD</title>
	
	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/CalendarDisplay2.js"></script>
 	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/addRow.js"></script>	
<%-- 	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/tabledeleterow-calendar.js"></script>	
 --%>   
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
	.classOprnleft_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classOprnleft_TDDYNA
	{
		width: 139px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classOprnright_TD
	{
		width:300px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classOprnright_TD_Qns
	{
		width: 50px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classOprnright_JS
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
		background: url('<%=recruitPath%>/images/delO.png') no-repeat; 
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
	.buttonalign
	{
		align: right;
	}
	.contentSize
	{
		border: 0px solid #FFFFFF;
	    clear: both;
	    display: block;
	    overflow: hidden;
	    padding-left: 0px;
	    width: 900px;
	    vertical-align: middle;
	}
	.wrapper
	{
		margin: 0 auto;
    	width: 900px;
	}
	</style>
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
	
	<script type="text/javascript">
	var chatQuesCount = 0;
	function chkLangValidation()
	{	
		var dynQues = document.getElementById('total_box').value;		
		var tname = document.getElementById('partHeader').value;
		if(tname == null || tname == '' || tname.trim().length == 0)
		{
			alert('Please enter header name !');
			document.getElementById('partHeader').focus();
			return false;
		}
		
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
		document.getElementById('previewpage').style.display = '';
		
		for (var i=0; i<parseInt(total_box); i++)
		{
			document.getElementById('ques'+i).style.display = '';
			document.getElementById('ans'+i).style.display = '';
			document.getElementById('quesText'+i).innerHTML = document.getElementById('mockTest'+(i+1)).value;
		}

	}
	function edit()
	{
		var dynQues = document.getElementById('total_box').value;		
		var tname = document.getElementById('partHeader').value;
		if(tname == null || tname == '' || tname.trim().length == 0)
		{
			alert('Please enter header name !');
			document.getElementById('partHeader').focus();
			return false;
		}
		
		var total_box = document.getElementById('total_box').value;
		 for (var i=1; i<=parseInt(total_box); i++)
		 {
			var addQues = document.getElementById('addQues'+i).value;
			if (addQues == null || addQues == "" )
			{
			 	 alert('Please Enter the question '+i+' .');		 
			 	 document.getElementById('addQues'+i).focus();
			 	 return false;
			}
		 }
		document.getElementById('mockAddQues').style.display = 'none';
		document.getElementById('previewpage').style.display = '';
		for (var i=0; i<parseInt(total_box); i++)
		{
			document.getElementById('ques'+i).style.display = '';
			document.getElementById('ans'+i).style.display = '';
			document.getElementById('quesText'+i).innerHTML = document.getElementById('addQues'+(i+1)).value;
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
<script type="text/javascript">
	function cancelButton()
	{
		document.getElementById('previewpage').style.display="none";	
		document.getElementById('mockAddQues').style.display="";
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
			String programName=(String)session.getAttribute("Program_name");
	  		System.out.println(":::::Program Name:::::"+programName);
	  		
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
						<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home </a>
						> 
					</font>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">
						Administration
						</a> 
						 >
					</font>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Admin_Manage_Operations_Qns.jsp">
						Manage Operation Interview Questionnaire
						</a> 
						>
					</font>
				
					<font class="nonLink">Edit</font>
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
					<br />
					<form action="<%=recruitPath%>/OperationsInterview" method="post" autocomplete="off">
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
					        		<th class="classOprnleft_TD" colspan="4">Operation Interview Questions for <%=programName%></th>
					        	</tr>
					        	
				  	        	 <tr id="part1header" style="display: none;">
				  	        	<!-- <tr> -->
				 					<td class="classOprnleft_TD">Part 1 Header</td>
					        		<td class="classOprnright_TD">
				   						<input type="text" name="partHeader" id="partHeader" class="reSizeforOther">
					        		</td>
					        		<td class="classOprnleft_TD">Number of Questions</td>
					        		<td class="classOprnright_TD">
										<div id="PartAPart1QCountDIV">
											1
										</div>
									</td>
					        	</tr> 
							</table>
						
							<table width="900px" border="0" cellpadding="6" cellspacing="6">
								<input type="hidden" name="total_box" id="total_box"/>
								<thead></thead>
								<tbody   id="tblSample"></tbody>
							</table>
						
							
							<!-- <table width="900px" border="0" cellpadding="6" cellspacing="6">
								<tr>
									<td align="right">
										<input type="button" class="buttonMedium" onclick="addRowQuestion();" value="Add Question">
									</td>
								</tr>
							</table>  -->
			
							<hr style="width:890px; height: 1px;">
							<table width="900px" border="0" cellpadding="6" cellspacing="6" id="buttonstbl">
								<tr id="Addbutton">
									<td colspan="4" align="left">
										<div align="left">		
											<input type="button" name="AddPart"  value="Add Part" class="buttonMedium" onclick="addRowHeader();"/>
										</div>					
									</td>
									<td colspan="4" align="right">
										<div align="right">		
											<input type="button" name="Preview"  value="Preview" class="buttonMedium" onclick="return edit();"/>
										</div>					
									</td>
								</tr>   	 		
							</table>
						</div>	
						<div id="previewpage" style="display: none;">
							<table style="width:700px;">
								<tr>
									<th colspan="4" width="1" height="32" class="theader">
										<div style="float:center;padding-left: 5px; font-size: 14px; font-family: Arial,Helvetica,sans-serif;">
											Operation Interview Question for <%=programName%> 
										</div>
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
											<div  style="font-size: 12px; display: none;" id="part0">
										    	<B>Part Header:::<span id="partText0"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="partans0">
										    	 
										    </div>						  				
										  
										    <div  style="font-size: 12px; display: none;" id="ques0">
										    	<B>Enter the Question 1 :::<span id="quesText0"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans0">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques1">
										    	<B>Enter the Question 2 :::<span id="quesText1"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans1">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques2">
										    	<B>Enter the Question 3 :::<span id="quesText2"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans2">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques3">
										    	<B>Enter the Question 4 :::<span id="quesText3"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans3">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques4">
										    	<B>Enter the Question 5 :::<span id="quesText4"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans4">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques5">
										    	<B>Enter the Question 6 :::<span id="quesText5"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans5">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques6">
										    	<B>Enter the Question 7 :::<span id="quesText6"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans6">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques7">
										    	<B>Enter the Question 8 :::<span id="quesText7"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans7">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques8">
										    	<B>Enter the Question 9 :::<span id="quesText8"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans8">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques9">
										    	<B>Enter the Question 10 :::<span id="quesText9"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans9">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques10">
										    	<B>Enter the Question 11:::<span id="quesText10"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans10">
										    	 
										    </div>
										    <div  style="font-size: 12px; display: none;" id="ques11">
										    	<B>Enter the Question 12:::<span id="quesText11"></span></B>								    
										    </div>									    
										    <div style="color: red; font-size: 12px;display: none;" id="ans11">
										    	 
										    </div> 
										</div>
									</td>
								</tr>
							</table>
						</div>
							<table width="700px" border="0" cellpadding="6" cellspacing="6" >
								<tr>
									<td colspan="4" align="left">
										<div align="left">		
											<input type="button" name="editb"  value="Edit" id="editb" class="buttonMedium" onclick="return cancelButton();"/>
										</div>					
									</td>
									<td colspan="4" align="right">
										<div align="right">		
											<input type="button" name="confirmb"  value="Confirm" id="confirmb" class="buttonMedium"/>
										</div>					
									</td>
								</tr>
							</table>	
						</div>
					</form>
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

