<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>
<html>
  <head>
	<title>[24]7 SPRINGBOARD</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
	<script type="text/javascript">
	function goToChatProcess()
	{
		document.getElementById("confirmation").style.display="none";
		document.getElementById("processing").style.display="";
		window.location.href ="<%=request.getContextPath() %>/247Recruit/jsp/VoiceTestConfirmation.jsp";
	}
	</script>
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
		
		.contentSize
		{
			border: 0px solid #FFFFFF;
		    clear: both;
		    display: block;
		    overflow: hidden;
		    width: 100%;
		}
	
		.wrapper
		{
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 900px;
		}
	</style>
  </head>
  
  <body>
            
	<%
		try
		{
			int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
			System.out.println("USER_AUTOID ::: " + USER_AUTOID);
			if(USER_AUTOID==0)
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
			String USER_Name =((String)session.getAttribute("USER_Name")).trim();
			System.out.println("User Name ::: " + USER_Name);
		
		    String USER_ID =(String) session.getAttribute("USER_ID");
		    System.out.println("USER_ID ::: " + USER_ID);
	 %>
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Voice Test</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	      <br/>  
	        <!-- ############################################ -->
	          <div class="wrapper">
					<div class="contentSize">
					  <form id="canvasForm" name="canvasForm" method="post" action="">
	
	    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void"  class="tPersonal">
      <tr class="allTdBackColor">
	    	 <td valign="top">	    	    									
				 <%
		 		    Connection con=null;
					Statement stmt=null;
					ResultSet rs=null;
					String getTollFreeNo=null;
					try
					{
						con=ConnectDatabase.getConnection();	
						String User_Center_Id = (String)session.getAttribute("User_Center_Id");
						System.out.println("User_Center_Id ::: " + User_Center_Id);
																			
						String queryForcurDate = "SELECT Toll_free_Number FROM toll_free_data where Center_Id="+User_Center_Id;
						stmt = con.createStatement();
						rs = stmt.executeQuery(queryForcurDate);
						if(rs.next())
						{
							getTollFreeNo = rs.getString("Toll_free_Number");
						}								
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
					}
					finally
					{
						ConnectionDAO.closeConnection(con, stmt, rs);	
					}
				 %>
				 <p><b>As part of the Voice selection process, you will need to undergo a HR round.</b></p>
				 <p><b>Please call one of the following phone numbers <label style="color: black; font-size: 14px;"><%=getTollFreeNo %></label>.</b></p>
				 <p><b>Kindly click on the Call Initiated Button once your call is connected to initiate the HR round. Please speak loud and clear.</b></p>		     
				 <p>Your Candidate Id number is:  <b><%=USER_ID%></b></p>
	    	   </td>
	        </tr>
	        <tr>
	        	<td style="height: 10px">
	        	</td>
	        </tr>
	        <tr>
	        	<td align="center" style="height: 41px">
	        		<input type="button" name="confirmation" class="buttonLarge240" id="confirmation" value="Call Initiated Successfully" onclick="goToChatProcess()"/>
	        		<span class="register" id="processing" style="display:none;"><b><font color="#000033" class="taL">Processing, please wait...</font></b></span>
	        	</td>
	        </tr>
	        </table>
		</form>
	  </div>
  </div>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			
	    </tr>
	</table>
 	<%
		}
		catch(Exception ex)
		{
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
