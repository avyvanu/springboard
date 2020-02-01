<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String USER_ID = "";
	int USER_AUTOID = 0;
	String User_Type_Id = "";
	String USER_Name = "";
	try
	{
		 USER_ID = (String)session.getAttribute("USER_ID");
		 System.out.println("USER_ID in SIM home page::::"+USER_ID);
	     USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
	     System.out.println("USER_AUTOID in SIM home page::::"+USER_AUTOID);
	     User_Type_Id = (String)session.getAttribute("User_Type_Id");
	     System.out.println("User_Type_Id in SIM home page::::"+User_Type_Id);
	     USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	     if(USER_Name==null)
		  	{
		  	   response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	     System.out.println("USER_Name in SIM home page::::"+USER_Name);
	}
	catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css"/>
	  <link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css" />
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
   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7</title>

 
 
	<link type="text/css" rel="stylesheet" href="../dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
	</head>
  <body>
  <table cellpadding="0" cellspacing="0" width="100%">
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	             <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">SIM</font> 
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2">
	        <!--  ************************************************************8 -->
  <form id="form1" name="form1" method="post" action="">
  <br/>
<!--  class="thHeaderImage" -->
 
    <table width="733" border="0" cellpadding="0" cellspacing="0" align="center">
     	  <%
		    Connection con=null;
			Statement stmtN=null;
			ResultSet rsN=null;
			String task_id=null;
			String taskDescription = "";
			String task_URL = "";
		try
		{
		 	String qryforSIMTasks = "SELECT tm.Task_Id,tm.task_description,tm.task_url FROM User_Type_Task_Mapping uttm,task_master tm WHERE uttm.task_id = tm.task_id and tm.Is_Active = 1 and uttm.User_Type_Id = "+User_Type_Id+" and tm.Pareent_Task_Id = 7  AND uttm.UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+USER_AUTOID+")";
		 	System.out.println("qryforSIMTasks::::"+qryforSIMTasks);
		 	con=ConnectDatabase.getConnection();
		 	stmtN=con.createStatement();
		    rsN=stmtN.executeQuery(qryforSIMTasks);
		    int i = 1 ;
		     while(rsN.next())
		      {
		    	task_id=rsN.getString("tm.Task_id");
		    	taskDescription = rsN.getString("tm.task_description");
		    	task_URL =  rsN.getString("tm.task_url");
		    	
	   %>
	        <tr>
		        <td>
		          <div align="center">
		           <input type="button" name="<%=taskDescription %>" value="<%=taskDescription %>" class="buttonLarge320" title="<%=taskDescription %>" onclick="javascript:location.href='<%=recruitPath%><%=task_URL %>'" /> 
		          </div>
		       </td>       
		      </tr>
      <%
            i++;
            }
            if(i == 1)
            {
            %>
             <tr>
		        <td>
		          <div align="center" style="color: #808080;font-family: Arial;font-size: 14px;font-weight: bold;" >No Access Granted
		          </div>
		         </td>
		     </tr>
		    <%
            }
	   }
	 catch(Exception ex)
	 {
	 	System.out.println(ex.getMessage());
	 	ex.printStackTrace();
	 }
	 finally
	 {
	 	ConnectionDAO.closeConnection(con,stmtN,rsN);
	 }
%>
      </table>
   
</form>

			<!-- ############################################ -->    
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

