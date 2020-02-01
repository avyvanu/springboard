
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test </title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<script language="javascript">
var keyvalues;
function document.onkeydown()
{
///alert(event.keyCode)
///alert("you press F5")
keyvalues=event.keyCode;

if ( event.keyCode==8)
{
//window.location.href = "Login.jsp";
////top.window.location = 'Login.jsp'
/////alert("you press F5/Back Space")


return false;
}
}
</script>
<script type="text/javascript">

function redirect()
{

// parent.test.location="Plain.jsp"

}

</script>
</head>

<body onload="redirect();">
<%
/// String USER_Name =(String)session.getAttribute("USER_Name");


 %>

<div class="wrapper">
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
  <h1>[24]7 Online Test</h1>
 <ul class="bread-crmb">
   <li>Welcome,<span class="username"><%// =username %></span><a class="li_alink"></a> </li>
   <li><a href="instruction.jsp"  class="li_alink" target="_top">Home</a></li>
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
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid"/>
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th colspan="2" class="taL">Congratulations</th></tr>
            

	 
	 
			
            <tr>
              <td width="45%" colspan="2" align="center" >
<h3>You have completed the precis writing assessment!</h3>
<h4>Please click <a href="<%=request.getContextPath()%>/jsp/instruction.jsp">here</a> to go back to home page.</h4>
	 
  
   
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