<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp"%> 
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String programName=(String)session.getAttribute("Program_name");
	System.out.println(":::::Program Name:::::"+programName);
		
	try
	{
		con = ConnectDatabase.getConnection();
		st = con.createStatement();
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
		
		String recruiterName=null;
		String recruiterid=null;
		String CandidateID = "Candidate Id";
		String higeduc = "Candidate Qualification";
		String fullName = "Candidate FullName";
		String ApplyingFor= "Applied for";
		String CandExp = "Work Experience";
		String CandExpOther = "Other Experience";
		
		Integer partid = 1;
		int questionid = 1;
		System.out.println(":::::+++++++:::::");
		
		
		
%>
<html>
	<head>
		<title>[24]7 SPRINGBOARD</title>
		
		<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>	
		<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/addRow.js"></script>	
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css" />
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/OprnInterview.css">
		
		<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
		.classheader_TD
		{
			
			font-size: 12px;
			background-color: #D8D8D8;
			font-family:Verdana, Arial, Helvetica, sans-serif;
		}
		.buttonSmallnoPointer
		{ 
			background: url('../images/Button_Small.png') no-repeat; 
			border-style: none;
			width:71px;
			height:41px;
			font-weight: bold;
			font-size: 11px;
			padding-right: 7px;
			padding-bottom: 5px;
			font-weight: bold;
			vertical-align: text-top;
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
		function cancel()
		{
			top.location.href = "<%=recruitPath%>jsp/Admin_Home_Page.jsp";
		}
		</script>
	
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="100%" >
			<tr>
				<td align="left">
					<img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
				</td>
				<td align="right">
					<img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
				</td>
			</tr>
			<tr class="tBackColor">
				<td align="left" colspan="2" style="height:12px;"></td>
			</tr>
			<tr>
				<td colspan="2" style="height:10px;"></td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px;">
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home </a> > 
					</font>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
						<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration</a> >
					</font>
					<font class="nonLink">Manage Stability Check Questionnaire</font>
				</td>
				<td align="right" style="padding-right: 10px;">
					<b><span class="recName"><%=USER_Name%></span></b>
					<font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor: hand; cursor: pointer;">Logout</a>
					</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<form action="<%= recruitPath %>jsp/Admin_Manage_StabilityChk_Edit.jsp" method="post" autocomplete="off">
						<br>
						<table width="900px" cellspacing="6" cellpadding="6" border="0">
							<tr>
				        		<th class="classheader_TD" style="padding: 6px;" colspan="4">
				        			View : Current Stability Check Questionnaire
				        		</th>
				        	</tr>
							<tr>
								<td width="120px" rowspan="3" style="padding: 0px;"> 
									<img src="<%= recruitPath %>images/default_person.jpg" width="120px" height="90px" alt="image" />
								</td>
								<td width="320px" class="allBackColor" id="candidateid" align="left"> &lt;<%=CandidateID%>&gt;
									<input type="hidden" name="recruitername" value="<%= recruiterName%>">
								</td>
								<td width="300px"  class="allBackmain" align="left" ><b>Highest Education</b></td>
								<td width="160px" class="allBackColor" align="left">
									&lt;<%= higeduc %>&gt;
								</td>
							</tr>
							<tr align="left">
								<td class="allBackColor">&lt;<%=fullName%>&gt;</td>
								<td class="allBackmain"><b>Customer Interaction Experience</b></td>
								<td class="allBackColor">
									&lt;<%= CandExp%>&gt;
								</td>
							</tr>
							<tr align="left">
								<td class="allBackColor">&lt;<%=ApplyingFor %>&gt;</td>
								<td class="allBackmain"><b>Other Experience</b></td>
								<td class="allBackColor">
									&lt;<%=CandExpOther%>&gt;
								</td>
							</tr>
						<%
							int rowcnt = 0;
							String description = null;
							String Porderno = null;
							Statement stmtpartid,stmtpart=null;
							ResultSet rsspartid,rsspart=null;
							String secqrypartid = "select Part_Description,Part_Id,order_no from Stability_part_master where isalive=1 order by order_no";
							System.out.println("Part id " + secqrypartid);
							stmtpartid = con.createStatement();
							rsspartid = stmtpartid.executeQuery(secqrypartid);
							while (rsspartid.next()) 
							{
								description = rsspartid.getString("part_description");
								rowcnt = rsspartid.getRow();
								System.out.println("Row number::" + rowcnt);
								partid = rsspartid.getInt("part_id");
								Porderno = rsspartid.getString("order_no");
								System.out.println("Part id " + partid);
								ArrayList<Integer> al = new ArrayList<Integer>();
								al.add(partid);
								System.out.println("Part id ::::" + al);
						%>
							<tr>
								<td colspan="4" class="allBackheading" align="left">
									Part-<%=Porderno%>&nbsp;<%=description%>
								</td>
							</tr>
							<tr class="allBackmain" align="center">
								<td colspan="1">Sl.No</td>
								<td align="left">Question</td>
								<td>Comments</td>
								<td>Score</td>
							</tr>
						<%
								String Question = null;
								String qorderno = null;
								String secpart = "select Question_Id,Question,order_no from stability_check_question_master where isalive=1 and  part_id="+ partid + " order by order_no";
								System.out.println("Stability table details " + secpart);
								stmtpart = con.createStatement();
								rsspart = stmtpart.executeQuery(secpart);
								while (rsspart.next())
								{
									questionid = rsspart.getInt("Question_Id");
									Question = rsspart.getString("Question");
									qorderno = rsspart.getString("order_no");
						%>
							<tr align="center">
								<td  class="allBackColor" colspan="1"><%=qorderno%></td>
								<td  class="allBackColor" align="left"><%=Question%></td>
								<td  style="background-color: #F2F2F2;">
									<textarea name="Comment"  id="Comment" rows="2" style="width: 100%; resize: none" disabled="disabled" ></textarea>
								</td>
								<td class="allBackColor">
									<select name="Score" size="1" id="Score" disabled="disabled" style="width: 100%; color: #342826; text-align: center">
										<option value="">Select</option>
									</select>
								</td>
							</tr>
	
						<%
							}
						}
						rsspart.close();								
						stmtpart.close();
						rsspartid.close();						
						stmtpartid.close();
						con.close();
						%>
							<tr>
								<td class="allBackheading" align="center" colspan="4">Mention all verbatim - in the interview form
									<input id="hPIDs" type="hidden" name="hPIDs" value="" />
									<input id="hQIDs" type="hidden" name="hQIDs" value="" />
									<input id="hQCounts" type="hidden" name="hQCounts" value="" />
								</td>
							</tr>
							<tr>
								<td  class="allBackmain" align="center" colspan="1">
									<b>Overall Comments</b>
								</td>
								<td class="allTdBackColor" colspan="3">
									<textarea name="comments" style="width: 100%" rows="4" id="comments" disabled="disabled" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
								</td>
							</tr>
							<tr>
								<td class="allBackmain" align="center">
									<b>TOTAL SCORE</b>
								</td>
								<td class="allBackColor" align="center">
									<b><input type="text" id="display" name="display" value="0" readonly="readonly" style="background: #F2F2F2; border-left: #F2F2F2; border-top: #F2F2F2; border-bottom: #F2F2F2; border-right: #F2F2F2; text-align: center" />
								</b>
								</td>
								<td colspan="2" align="center">
									<table border="0" width="100%">
										<tr>
											<td nowrap="nowrap" style="font-family: Arial;font-size: 12px;color: #41383C;" >
												<input type="radio" name="select" value="1" style="padding-left: 10px;" disabled="disabled" />Select
												<input type="radio" name="select" value="2" style="padding-left: 10px;" disabled="disabled" />Hold
												<input type="radio" name="select" value="3" style="padding-left: 10px;" disabled="disabled" />Reject
											</td>
											<td align="left">
												<input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmallnoPointer" disabled="disabled"/>
											</td>
											<td>
												<input name="Submit" id="Submit" type="submit" value="Submit" class="buttonSmallnoPointer" disabled="disabled"/>
											</td>	
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" colspan="3">
									<input name="Back" id="Back" type="button" value="Back" class="buttonMedium" onclick="return cancel();"/>
								</td>
								<td align="right" colspan="3">
									<input name="Edit" id="Edit" type="submit" value="Edit" class="buttonMedium" />
								</td>	
							</tr>	
						</table>
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
	catch (Exception ex)
	{
		System.out.println("=========" + ex.getMessage());
		ex.printStackTrace();
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
