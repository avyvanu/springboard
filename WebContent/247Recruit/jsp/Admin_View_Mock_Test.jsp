<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
  <head>
    <title>[24]7 SPRINGBOARD </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	.theader
	{
			background: url("<%=request.getContextPath() %>/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;color: #FFFFFF;
	}
</style>
   </head>
  <%
	String getMockId = request.getParameter("getMockId");
	System.out.println("getMockId \t"+getMockId);
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	String ques = "";
	String testQuesName = "";
	String mockStatus = "";
	ArrayList<String> arrQues = new ArrayList<String>();

  

	try
	{
		String query="SELECT Chat_Script_Id, Chat_Question_Id, Chat_Question, Is_Active FROM  mock_chat_scripts WHERE Chat_Script_Id ="+getMockId; 
		System.out.println("query \t"+query);
		con=ConnectDatabase.getConnection();		
		stmt=con.createStatement();
		rs=stmt.executeQuery(query);
		while(rs.next())
		{
			ques = rs.getString("Chat_Question");
			arrQues.add(ques);
			testQuesName = rs.getString("Chat_Script_Id");
			mockStatus = rs.getString("Is_Active");
		}	
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	
  %>
	<body ondragstart="return false" onselectstart="return false">
		<br/>
		<div style="height: 10px;">
		</div>
		<div class="wrapper">
			<div class="inner-content">
				<div class="invalid-log-alert"></div>
				<form id="chatDump" name="chatDump" method="post" action="<%=request.getContextPath()%>/MockServlet">
					<table style="width:700px;">
						<tr>
							<th colspan="4" width="1" height="32" class="theader"><div style="float:left;padding-left: 5px;">
								Mok Chat Test Assessment  </div><div style="float:right;"><div style="float:right;">Time Remaining <input type="text" name="disp" id="disp" readonly="readonly" size="5" value="10:00" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;"/> </div></div>
							</th>
						</tr>
					</table>
					<div class="forms">
						<input type="hidden" name="transcriptdump" id="transcriptdump"/>
						<input type="hidden" name="AutoScriptID" value=""/>
						<table border="0">
							<tr>
								<td colspan="4">
									<div class="quest_input_new" id="chatwindow">
										<p style="font-size: 12px;">
											<%
												Iterator ir = arrQues.iterator();	
												int qNo = 0;											
									  			while(ir.hasNext())
									   			{
									   				Object objQues= ir.next();
									   		%>
									   				
									  					<b style="font-size: 12px;">:: Customer :: </b> <span style="font-size: 12px;"><%=objQues%></span><br/>
									  					<p style="color: red; font-size: 12px;"><b>:: Candidate Name ::</b> < Response > </p>
									    	<%
									   					
									   			}
									   		%>
										</p>
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
									<input type="button" value="Send" id="submit" class="buttonSmall" name="submit" onclick="return textvalidate(), focusset()" disabled="disabled" style="	cursor: default;"/>
									
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>		
		</div>
	</body>
</html>
