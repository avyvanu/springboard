<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test Instructions</title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>

</head>

<body>
<%
Connection con = null;
String USER_Name =(String) session.getAttribute("USER_Name");
Long USER_AUTOID =(Long) session.getAttribute("USER_AUTOID");

session.setAttribute("ip","http://192.168.1.83");

   
 %>

<div class="wrapper" id="wrapper">
<div class="header"> <a href="#"><img src="../images/logo-24-7.gif" alt="[24]7" title="[24]7" class="logo" /></a>
  <div class="clear">
    <!--&nbsp;-->
  </div>
</div>
<div class="main-nav">
  <div class="main-nav-js" >
    
  </div>
</div>
<div class="content">

<div class="pageHead">
  <h1>
Welcome to the [24]7 Online Test!</h1>
 <ul class="bread-crmb">
   <li>Welcome,<span class="username">&nbsp;<%=USER_Name %></span><a class="li_alink"></a> </li>

    <li><a href="ControllerServlet?target=Logout" class="">Logout</a></li>
    
    
  </ul>
</div>
<div class="clear">
  <!-- &nbsp; -->
</div>
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 100%;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;" class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th colspan="2" class="taL">&nbsp;
                
            </th></tr>
            <tr>
              <td width="45%" colspan="2" align="left" >
<h3>Dear <span class="username"><%=USER_Name %></span></h3>

 <p>The online test comprises of 3 modules.Before you starts test, please select option. </p>
<!-- div style="height:5px;"></div-->

  </td> </tr>
            <tr><td valign="top" width="45%" colspan="2" align="center" >
            
<div>
	
	 <form method="post" action="ControllerServlet">
	 <table border="0" align="left" width="0%">
	<input type="hidden" name="target" id="target" value="WithCamWithoutCam"/>
	
	 <tr>
		<td>
				
			<br><input type="radio" name="WithCam"  value="Yes" id="WithCam"/>Yes, I would like to take the test with the Webcam &nbsp; 
			<br><input type="radio" name="WithCam" value="No" id="WithCam"/>No, I would like to take the test without the Webcam
		
		
	  </td>
	 </tr>
	<tr>
	
		<td align="right">
			<input type="submit" name="Proceed" value="" class="proceed" id="proceed"/>
		</td>
	</tr>
	</table>
   </form>

</div>



<p style="display: none;"><canvas id="canvas" height="240" width="320"></canvas></p>




<ul id="cams"></ul>
<div style="text-align: right;">
<input type="button" value="" class="proceed" id="proceed" style="display:none;" onclick="redirect();" />
</div>
</td>
</tr>
           
          </tbody></table>
        </div>
        
      
     
    </div>
    
  </div>
  <div class="rightside rundgratxt">
  
    
    
  </div>
</div>
</div>

<div class="footer">
    <p>&copy; Copyright 2010 [24]7. All rights reserved. <a href="#">Legal</a>|<a href="#">Privacy Policy</a></p>
     </div>
</div>






</body></html>


