<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css" />
	<style type="text/css">
		html,body
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
			height: 150px;
		}
	
		.wrapper
		{
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 900px;
			height: 150px;
		}
	</style>
	
</head>
  
  <body>
   	 <table cellpadding="0" cellspacing="0" width="100%">
	   <tr>
	        <td align="left">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/logo-24-7.gif" alt="Logo" />
	        </td>
	        <td align="right" valign="bottom" style="color:#666666; font-size:16px; font-family:Arial; padding-right:30px; padding-bottom:15px;">
	           The Intuitive Consumer Experience Company™
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
	        <td colspan="2" align="center">
	        <br/>  
	          <div class="wrapper">
					<div class="contentSize">
					    <table width="100%" border="0"  cellpadding="6" cellspacing="6" frame="void" class="tPersonal">
					    	<tr class="allTdBackColor">
					    	   <td align="center" valign="middle">
								 <%
									String errcode = ((String)request.getParameter("ec")).trim();
									System.out.println("error code::: "+errcode);
									if(errcode.compareToIgnoreCase("404")==0)
									{
										System.out.println("404...");
								 %>
								
									<h3>Error 404 !</h3>
									<h4>The Requested page was not found.</h4>
                                 <%
                                 	}
                                    else 
                                    {
	                                    if(errcode.compareToIgnoreCase("500")==0)
										{
											System.out.println("500...");
								 %>
									<h3>Error 500 !</h3>
									<h4>Status: 500 Internal Server Error.</h4>
								 <% 
										}
										else
										{
											System.out.println("Unexpected..."+errcode);
								 %>
									<h3>Error !</h3>
									<h4>Status: Unexpected Error.</h4>
								 <% 
										}
									}
								 %>
					    	   </td>
					        </tr>
				        </table>
					</div>
				  </div>
			      <br/>  
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#666666; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>
  </body>
</html>
