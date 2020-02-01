<!DOCTYPE html "-//W3C//DTD XHTML 1.0 TRANSATIONAL //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transtional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="GlobalDeclare.jsp"%>
<%
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
<html>
	<head>
	    
		<title>[24]7 SPRINGBOARD</title>
		   
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Recruiter.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css">
		<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
		<style type="text/css">
			.html,.body,.form
			{
				margin:0px;
			}
			.theader
			{
				background: url("<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
				color: #FFFFFF;
			}
		 	.classtypeTestleft_TD
			{
				width:100px;
				font-size:12px;
				background-color:#D8D8D8;
				font-family:Verdana, Arial, Helvetica, sans-serif;
			}
			.classtypeTestright_TD
			{
				width:200px;
				font-size:12px;
				background-color:#F8F8F8;
				font-family:Verdana, Arial, Helvetica, sans-serif;
			}
			.inputText
			{
			width:100%;
			}
			.textarea
			{
				background-color:#FFFFFF;
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
			if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) 
			   	|| (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13 
			   	|| charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 
			   	|| charCode == 34 || charCode == 39 )
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
		function AllowCharsName(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) 
			   	|| (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32)
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
		function showPreview()
		{
			var textname=document.getElementById('type_name').value;
			var textpassage=document.getElementById('text_area').value;
			var textHeader = document.getElementById('type_header').value;
			textname=textname.trim();
			textpassage=textpassage.trim();
			textHeader=textHeader.trim();
			
			if(textname ==''||textname==null||textname.length==0)
			{
				alert("Please enter the test Name !");
				document.getElementById('type_name').focus();
				return false;
			}
			if(textHeader ==''||textHeader == null||textHeader.length==0)
			{
				alert("Please enter the test Header !");
				document.getElementById('type_header').focus();
				return false;
			}
			if(textpassage == ''||textpassage == null||textpassage.length==0)
			{
				alert("Please enter the passage !");
				document.getElementById('text_area').focus();
				return false;
			}
			document.getElementById('linkdetails').style.display="";
			document.getElementById('addpage').style.display="none";
			document.getElementById('previewpage').style.display="";
			document.getElementById('textdetails').innerHTML=textpassage;
			document.getElementById('typing_Header').innerHTML=textHeader;
			
		}
		
		function cancelAddView()
			{
				if(confirm('Are you sure you want to cancel ? Changes made will not be saved.'))
				{
					parent.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest.jsp';
				}
			}
		</script>
		
		<script type="text/javascript">
		function confirmButton()
		{
			var con=confirm('Are you sure you want to add this test? It will be available to candidates immediately.');
			if(con==true)
			{
				top.location.href = "<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest_AddEditDelete.jsp";
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
			document.getElementById('linkdetails').style.display="";
			document.getElementById('addpage').style.display="";
		}
		</script>
		<script type="text/javascript">
		function focustypename()
		{
			document.getElementById('type_name').focus();	
		}
		</script>
	</head>
	  
	<body onload="return focustypename();">
		<form action="<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest_AddEditDelete.jsp" method="post">
			<table cellspacing="0" cellpadding="0" width="100%" >
				<tr>
					<td align="left" >
						<img src="<%=request.getContextPath()%>/247Recruit/images/247_Logo_left.jpg" alt="Logo"/>
					</td>
					<td align="right">
						<img src="<%=request.getContextPath()%>/247Recruit/images/Springboard_LOG.jpg" alt="Logo"/>
					</td>
				</tr>
				<tr class="tBackColor">
					<td align="left" colspan="2" style="height:12px;"></td>
				</tr>
				<tr>
					<td colspan="2" style="height:12px;"></td>	
				</tr>
				<tr id="linkdetails">
					<td align="left" style="padding-left:10px;">
						<font style="color:#7E7E7E;font-weight:bold;font-size:12px;font-family:Arial;">
							<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a>
							>
						</font>
						<font style="color:#7E7E7E;font-weight:bold;font-size:12px;font-family:Arial;">
							<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration</a>
							>
						</font>
						<font style="color:#7E7E7E;font-weight:bold;font-size:12px;font-family:Arial;">
							<a href="<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_TypingTest.jsp">Manage Typing Test</a>
							>
						</font>
						<font class="nonLink">Add</font>
					<td align="right" class="recName" style="padding-right:10px;">
						<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
					</td>
				</tr>	
				<tr id="addpage">
					<td align="center" style="height:10px;" colspan="2" ><br/>
						<div id="viewDetailsData">
							<table border="0" cellspacing="6" cellpadding="6" >
								<tr style="font-size: 14px;">
									<th class="classtypeTestleft_TD" colspan="2">Add New Typing Test</th>
								</tr>
								<tr>
									<td class="classtypeTestleft_TD" nowrap="nowrap">Test Name</td>
									<td class="classtypeTestright_TD" nowrap="nowrap" >
										<input type="text" id="type_name" name="type_name" maxlength="45" class="reSizeforOther" style="width: 600px;" onkeypress="return AllowCharsName(event);">
									</td>
								</tr>
								<tr>
									<td class="classtypeTestleft_TD" nowrap="nowrap">Test Header</td>
									<td class="classtypeTestright_TD" nowrap="nowrap" >
										<input type="text" id="type_header" name="type_header" maxlength="100" class="reSizeforOther" style="width: 600px;" onkeypress="return AllowCharsName(event);" value="Paragraph to be Typed. Please click on Start after reading the passage : ">
									</td>
								</tr>
								<tr>
									<td class="classtypeTestleft_TD" nowrap="nowrap">Passage</td>
									<td colspan="3" class="classtypeTestright_TD" nowrap="nowrap">
										<textarea id="text_area" name="text_area" class="reSizeforOther"  style="width: 600px; height: 210px;" onkeypress="return AllowChars(event);" ></textarea>	
									</td>
								</tr>
								<tr>
									<td align="left">
										<div align="left">
											<input type="button" id="cancel_Button" name="cancel_Button" value="Cancel" class="buttonMedium" onclick="return  cancelAddView();">
										</div>
									</td>
									<td align="right">
										<div align="right">
											<input type="button" id="preview_Button" name="preview_Button" value="Preview" class="buttonMedium" onclick="showPreview();">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>	
				</tr>
				<tr id="previewpage" style="display:none;" >
					<td align="center"style="height:10px;" colspan="2" ><br/>
						<div id="Adddetails">
							<div class="forms" align="center">
								<table border="0" cellpadding="6" width="700" cellspacing="0" style="border-color: white;" >
									<tr>
										<th class="taL">
											<div style="float: left;">
												Typing Test
											</div>
											<div style="float: right;">
												Time Remaining
												<input type="text" name="disp" size="3" value="3:00" class="timer" id="disp"/>
											</div>
										</th>
									</tr>
									<tr>
								       <td><div style="float:left;"> <p id="typing_Header" style="color: #aa0000;font-weight: bold;"></p></div></td>
								    </tr>
									<tr>
										<td>
											<div onmousedown="return false">
												<textarea class="quest_output" id="textdetails" style="width: 680px; height: 200px; overflow-x: hidden;resize:none;"  readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
											</div>
										</td>
									</tr>
									<tr  id="displayDIVtextArea">
										<td>
											<div>
												<textarea class="quest_input" id="reply" name="reply" style="color: red; font-size: 10px; resize: none;" onKeyDown="return nocopypaste(event)" readonly="readonly" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
											</div>
										</td>
									</tr>
									<tr id="TRowForSubmit" >
										<td colspan="1" align="right">  
											<input name="Submit" id="Submit" type="submit" value="Finish" disabled="disabled" class="buttonSmall" /> 
											<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL" colspan="2">Processing, please wait...</font></b></span>
										</td>
									</tr>
									<tr>
										<td align="center" style="background: none;">
											<div style="background: none;">
												<span style="padding-right:520px;">
													<input type="button" id="edit_Button" name="edit_Button" value="Edit" class="buttonSmall" onclick="return cancelButton();">
												</span>
												<span>
													<input type="submit" id="buttons" name="buttons" value="Confirm" class="buttonSmall" onclick="return confirmButton();">
												</span>								
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>	
				</tr>
				<tr>
					<td style="height:10px;" colspan="2"></td>
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
		</form>
	</body>
</html>
