<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
    String USER_Name =((String)session.getAttribute("USER_Name")).trim();
	System.out.println("USER_Name : "+USER_Name);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>[24]7 Gotya!</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
		
 <style type="text/css">
        
  html,body
	{
		margin: 0px;
	}
	
	.logo
	{
		height: 69px;
		width: 143px;
	}
        .watermark
        {       		 
        	color:gray;       		
       	}
       	
       	  .contentSize
	{
		clear: both;
	    display: block;
	    overflow: hidden;
	    padding: 6px 4px;
	    width: 720px;
	}
	.wrapper
	{
		margin: 0 auto;
    	width: 720px;
	}
	
	
	.content
	{
		clear: both;
	    display: block;
	    overflow: hidden;
	    padding: 6px 4px;
	    width: 720px;
	    
	}
   	 </style>
   	<script type="text/javascript">
   	function goTOInstructionPage()
   	{
   		window.location.href='<%=request.getContextPath()%>/jsp/instruction.jsp';
   	}
   	</script>
	</head>

	<body>
	 <table border="0" cellpadding="0" cellspacing="0" width="100%">
	   <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	     	<td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Mock Chat Test > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Success</font>
	        </td>
   	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	
    <br/>
		

		<div class="wrapper">
		<div class="content">
		<table width="700px" height="100px" cellspacing="1" cellpadding="6" border="0">
				<tbody>
					<tr align="left" style="color:white;">
						<th colspan="2" style="background-image:url(<%=request.getContextPath()%>/247Recruit/images/header_BG.jpg)">
							Congratulations
						</th>
					</tr>
					<tr>
						<td colspan="2" align="center" style="background:none repeat scroll 0 0 #F7F7F7;color: #666666;">
							<h3 style="display: block;font-size: 14px;font-family: Arial,Helvetica,sans-serif; margin: 0 0 10px;">
								You have completed Mock Chat Test !
							</h3>
							<h4 style="font-size: 17px;font-family: Arial,Helvetica,sans-serif;">
								Please click <a style="color: #F28900;text-decoration: underline;font-size: 17px;" onclick="goTOInstructionPage();">here</a> to go back to home page.
							</h4>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
		</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    
	</table>
	</body>
</html>
