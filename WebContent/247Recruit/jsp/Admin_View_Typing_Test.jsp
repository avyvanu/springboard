<!DOCTYPE html "-//W3C//DTD XHTML 1.0 TRANSATIONAL //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transtional.dtd">
<%@ page isELIgnored="false" language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
	<head>
	    
		<title>[24]7 SPRINGBOARD</title>
		    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="/springboard/247Recruit/css/Recruiter.css">
		<link rel="stylesheet" type="text/css" href="/springboard/247Recruit/css/MasterTheme.css">
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
		</style>
		
	</head>
	 
	<body>
		<%
		String typeTestId=request.getParameter("testTypeId");
		System.out.println("typeTestId::::"+typeTestId);
		Connection connection=null;
		try
		{
			connection=ConnectDatabase.getConnection();
			String typingPassage = null;
			String typingHeader = null;
			String viewQuery="SELECT TYPING_MASTER_ID,PASSAGE,Typing_Test_Header FROM bpo_typing_master WHERE TYPING_MASTER_ID='"+typeTestId+"'"; 
			System.out.println("::::typeTestId::::"+typeTestId);
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(viewQuery);
			if(rs.next())
			{
				typingPassage = rs.getString("PASSAGE");
				if(typingPassage == null)
				{
					typingPassage = "No Passage available";
				}
				else
				{
					typingPassage = typingPassage.trim();
				}
				typingHeader = rs.getString("Typing_Test_Header");
				if(typingHeader == null)
				{
					typingHeader = "No Header available";
				}
				else
				{
					typingHeader = typingHeader.trim();
				}
				
		%>
				<table cellspacing="0" cellpadding="0" width="100%" >
					<tr>
						<td colspan="2" style="height:12px;"></td>	
					</tr>
					<tr>
						<td align="center" style="height:10px;" colspan="2">
							<form action="">
								<div class="forms" align="center">
								<table border="0" cellpadding="6" width="700" cellspacing="6">
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
								       <td><div style="float:left;"> <p style="color: #aa0000;"><b><%=typingHeader %> </b></p></div></td>
								    </tr>
									<tr>
										<td>
											<div onmousedown="return false">
												<textarea class="quest_output" id="passage" style="width: 680px; height: 200px; overflow-x: hidden;resize:none;"  readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"><%=typingPassage %></textarea>
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
								</table>
							</div>
								
							</form>
						</td>	
					</tr>
					
				</table>
		<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
	</body>
</html>
