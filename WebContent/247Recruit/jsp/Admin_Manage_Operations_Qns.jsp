<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
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
	
	String DuplicateCheck = (String) session.getAttribute("InsertState");
	if (session.getAttribute("InsertState") != null)
	 {
	
		 if (DuplicateCheck.equalsIgnoreCase("Successfully_Inserted")) 
		 {
			%>
				<script type="text/javascript">
					alert("Questions inserted successfully!");
				</script>
			<%
		}
		 else if (DuplicateCheck.equalsIgnoreCase("Not_Inserted")) 
		 {
			%>
				<script type="text/javascript">
					alert("Questions not inserted !");
				</script>
			<%
		}
		 session.removeAttribute("InsertState"); 
	}
	int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
	if(USER_AUTOID == 0)
	 	{
	 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	 	}
	System.out.println("USER_AUTOID in home page::::"+USER_AUTOID);
	String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
	if(IsSAdmin == null)
	 {
	 	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Login.jsp");
	 }
	System.out.println(":::::::::IsSAdmin:::::::::"+IsSAdmin);
	String query = "";
	String countquery = "";

	Connection connection=ConnectDatabase.getConnection();		
	boolean User_AllPrrmsAccess = false;
	String QueryUserAllPrgms = "SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ USER_AUTOID + "' AND Program_Id = 0";
	System.out.println("QueryUserAllPrgms::::::" + QueryUserAllPrgms);
	Statement stmtsprogs = connection.createStatement();
	ResultSet rssprogs = stmtsprogs.executeQuery(QueryUserAllPrgms);
	User_AllPrrmsAccess = rssprogs.next();
	System.out.println("User_AllPrrmsAccess::::"+User_AllPrrmsAccess);
	session.setAttribute("User_AllPrrmsAccess",User_AllPrrmsAccess);
	rssprogs.close();
	stmtsprogs.close();
%>

<html>
  <head>
   <title>[24]7 SPRINGBOARD</title>
   <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<script type="text/javascript" language="javascript">	
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
	</script>
	
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
  </head>
  <body>
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
			<td align="left" colspan="2" style="height:12px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="height:10px;"></td>
		</tr>
		<tr>
			<td align="left" style="padding-left:10px;">
				<font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
					<a href="<%=recruitPath%>jsp/Home_Page.jsp">Home  </a>>
				</font>
				<font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
					<a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration  </a>>
				</font>
				<font class="nonLink">Manage Operation Interview Questionnaire</font>
			</td>
			<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" valign="top">
			  <br/>
					<table width="970px" border="0" cellpadding="0" cellspacing="0">
	          	 	<%
					
	          	 	int count = 0;
					 Statement stmtct = connection.createStatement();
					 countquery="SELECT count(*) as count FROM program_names_master WHERE Is_Alive = 1 AND Program_id IN (SELECT Program_id FROM user_program_mapping WHERE User_Id = '"+USER_AUTOID+"')";
					 ResultSet rscount=stmtct.executeQuery(countquery);
					if(rscount.next()) 
					 {
					 	count = rscount.getInt("count");
					 	System.out.println("Count : " +count);
					 } 
					if((count == 0) && User_AllPrrmsAccess == false && IsSAdmin.equalsIgnoreCase("No") )
					{
					%>	
						<tr>
							<td>
								<div align="center" style="color: #808080;font-family: Arial;font-size: 12px;font-weight: bold;" >Not configured to any programs to Manage operations interview questionnaire.</div>
							</td>
					<%
					}
					else if(count > 0 || User_AllPrrmsAccess == true || IsSAdmin.equalsIgnoreCase("Yes"))
					{
					%>
							<td style="width:450px;">
								<iframe src="<%=recruitPath%>jsp/Admin_Manage_OperationsLeft.jsp" name="left" width="420px" height="400" scrolling="auto" frameborder="0" ></iframe>
							</td>
							<td style="width:450px;">
								<iframe src="<%=recruitPath%>jsp/Admin_Manage_OperationsRight.jsp" name="right" width="550px" height="400" scrolling="auto" frameborder="0" ></iframe>
							</td>
						<%}%>
						</tr>
				  	</table>
				<br/>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="height:10px;"></td>
		</tr>
		<tr class="footerBackColor" >
			<td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
			
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