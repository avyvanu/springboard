<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% 

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";
	int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	if(USER_AUTOID == 0)
	{
	response.sendRedirect("Login.jsp");
	}
	 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test Instructions</title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<script type="text/javascript">

function redirect()
{
window.location.href = "<%=path%>/247Recruit/jsp/PrecisWritingTest.jsp";
return false;
}
function logout()
{
<% if(session.getAttribute("ip") != null){
%>
top.window.location.href='<%=request.getContextPath()%>/jsp/Login.jsp';
<%
}else{
%>
window.location.href = "ControllerServlet?target=Logout";
<%
}%>

}
</script>
</head>

<body onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<%

String USER_Name =(String) session.getAttribute("USER_Name");




 %>
<div class="wrapperSize">
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
  <h1>[24]7 Precis Writing Test Instructions</h1>
 <ul class="bread-crmb">
   <li>Welcome,<span class="username">&nbsp;<%=USER_Name %></span><a class="li_alink"></a> </li>
   <li><a href="instruction.jsp" class="li_alink">Home</a></li>
    <li><a  href="#" class="" onclick="logout();">Logout</a></li>
    
    
  </ul>
</div>
<div class="clear">
  <!-- &nbsp; -->
</div>
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 720px;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;" class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th class="taL" colspan="2">Please go through the instructions below, before you proceed.
              </th></tr>
            <tr>
              <td width="45%" colspan="2" >

  
  <h3>Precis Writing Test</h3>
  
  <ul><li>Duration of  Assessment: 10 minutes</li>
      <li>A timer would be displayed above the passage on the right, indicating the time remaining to complete the assessment. The timer will commence as soon as you position the cursor in the typing section, indicating you are ready to start typing.</li>
      <img src="<%=recruitPath%>images/precis_instruction.jpg" alt="" align="center" style="width:680px" />
  	  <li>As soon as you complete typing 60 words, please click on FINISH. This will stop the timer and will indicate the time you have taken to complete the Precis Writing test.   </li>
      <li>You may exit the test anytime by clicking on FINISH. Please remember, you would not be allowed to take the Precis Writing test again.  <b>FINISH</b> button. </li>
      <li>When you are ready to take the assessment, please click on <b>START</b>.<br/>
    <b style="color: red;"> Note: </b>Time Starts when you click on Start button</li>
	</ul>
	
   
  </td>
              
            </tr>
            
            <tr>
              <td class="taR">
              </td><td class="alterRow"><div style="float: right; overflow: hidden; margin: 0px 48px 0pt 0pt;">
                  <input type="image" class="btn" value="Start" id="submit" name="submit" onclick="javascript:redirect();" src="<%=path%>/247Recruit/images/start.png" />
                </div></td>
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